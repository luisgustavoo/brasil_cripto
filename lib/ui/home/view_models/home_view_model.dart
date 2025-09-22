import 'dart:async';

import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required CoinsMarketsRepository coinsMarketsRepository,
    required FavoritesRepository favoritesRepository,
  }) : _coinsMarketsRepository = coinsMarketsRepository,
       _favoritesRepository = favoritesRepository {
    fetchCoinsMarkets = Command1(_fetchCoinsMarkets);
    toggleFavorite = Command1(_toggleFavorite);
    getFavorites = Command0(_getFavorites);
  }

  final CoinsMarketsRepository _coinsMarketsRepository;
  final FavoritesRepository _favoritesRepository;
  late final Command1<void, String?> fetchCoinsMarkets;
  late final Command1<void, Coin> toggleFavorite;
  late final Command0<void> getFavorites;
  String vsCurrency = '';
  String? names;
  StreamSubscription<List<Coin>>? _favoriteSubscription;
  StreamSubscription<List<Coin>>? _coinsMarketSubscription;
  List<Coin> coins = [];
  List<Coin> favoriteCoins = [];

  Future<Result<void>> _fetchCoinsMarkets([String? names]) async {
    try {
      this.names = names;
      final result = await _coinsMarketsRepository.fetchCoinsMarkets(
        vsCurrency,
        names: names,
      );
      switch (result) {
        case Ok():
          coins = [...result.value];
          if (coins.isNotEmpty) {
            _coinsMarketsRepository.starPollingService();
            _startCoinsMarketSubscription();
          } else {
            _coinsMarketsRepository.stopPollingService();
            _stopCoinsMarketSubscription();
          }
          return const Result.ok(null);
        case Error():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _toggleFavorite(Coin coin) async {
    try {
      if (coin.isFavorite) {
        return _removeFavorite(coin.id);
      }
      return _addFavorite(coin.id);
    } finally {
      await _getFavorites();
      await _fetchCoinsMarkets(names);
      notifyListeners();
    }
  }

  Future<Result<void>> _getFavorites() async {
    try {
      final result = await _favoritesRepository.getFavorites(vsCurrency);
      switch (result) {
        case Ok():
          favoriteCoins = [...result.value];
          notifyListeners();
          if (favoriteCoins.isNotEmpty) {
            _favoritesRepository.starPollingService();
            _startFavoriteSubscription();
          } else {
            _favoritesRepository.stopPollingService();
            _stopFavoriteSubscription();
          }
          return const Result.ok(null);
        case Error():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addFavorite(String id) async {
    return _favoritesRepository.addFavorite(id);
  }

  Future<Result<void>> _removeFavorite(String id) async {
    return _favoritesRepository.removeFavorite(id);
  }

  void _startFavoriteSubscription() {
    if (_favoriteSubscription != null) {
      return;
    }
    _favoriteSubscription = _favoritesRepository.favoriteCoins?.listen(
      (favoriteCoins) {
        this.favoriteCoins = [...favoriteCoins];
        notifyListeners();
      },
    );
  }

  void _startCoinsMarketSubscription() {
    if (_coinsMarketSubscription != null) {
      return;
    }
    _coinsMarketSubscription = _coinsMarketsRepository.coins?.listen(
      (coins) {
        this.coins = [...coins];
        notifyListeners();
      },
    );
  }

  void _stopFavoriteSubscription() {
    _favoriteSubscription?.cancel();
  }

  void _stopCoinsMarketSubscription() {
    _coinsMarketSubscription?.cancel();
  }

  @override
  void dispose() {
    _stopFavoriteSubscription();
    _stopCoinsMarketSubscription();
    _favoritesRepository.stopPollingService();
    _coinsMarketsRepository.stopPollingService();
    super.dispose();
  }
}
