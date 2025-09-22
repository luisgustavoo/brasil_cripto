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
  StreamSubscription<List<Coin>>? _subscription;
  List<Coin> coins = [];
  List<Coin> favoriteCoins = [];

  @postConstruct
  void init() {
    _subscription = _favoritesRepository.favoriteCoins.listen(
      (favoriteCoins) {
        this.favoriteCoins = [...favoriteCoins];
        notifyListeners();
      },
    );
  }

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

  @override
  void dispose() {
    _subscription?.cancel();
    _favoritesRepository.stopPollingService();
    super.dispose();
  }
}
