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
    getFavorites = Command1(_getFavorites);
    _init();
  }

  final CoinsMarketsRepository _coinsMarketsRepository;
  final FavoritesRepository _favoritesRepository;
  late final Command1<void, ({String names, String vsCurrency})>
  fetchCoinsMarkets;
  late final Command1<void, Coin> toggleFavorite;
  late final Command1<void, String> getFavorites;
  late String vsCurrency = '';
  late ({String names, String vsCurrency}) queryParameters;
  late StreamSubscription<List<Coin>> _subscription;
  List<Coin> coins = [];
  List<Coin> favoriteCoins = [];

  void _init() {
    _subscription = _favoritesRepository.favoriteCoins.listen(
      (favoriteCoins) {
        this.favoriteCoins = [...favoriteCoins];
        notifyListeners();
      },
    );
  }

  Future<Result<void>> _fetchCoinsMarkets(
    ({String names, String vsCurrency}) queryParameters,
  ) async {
    try {
      final (names: names, vsCurrency: vsCurrency) = queryParameters;
      this.vsCurrency = vsCurrency;
      this.queryParameters = queryParameters;
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
      await _getFavorites(vsCurrency);
      await _fetchCoinsMarkets(queryParameters);
      notifyListeners();
    }
  }

  Future<Result<void>> _getFavorites(String vsCurrency) async {
    try {
      this.vsCurrency = vsCurrency;
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
    _favoritesRepository.stopPollingService();
    _subscription.cancel();
    super.dispose();
  }
}
