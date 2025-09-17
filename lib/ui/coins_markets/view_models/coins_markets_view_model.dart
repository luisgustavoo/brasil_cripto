import 'dart:async';
import 'dart:developer';

import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/use_cases/favorites/favorite_get_use_case.dart';
import 'package:brasil_cripto/domain/use_cases/favorites/favorite_toggle_use_case.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CoinsMarketViewModel extends ChangeNotifier {
  CoinsMarketViewModel({
    required CoinsMarketsRepository coinsMarketsRepository,
    required FavoriteGetUseCase favoriteGetUseCase,
    required FavoriteToggleUseCase favoriteToggleUseCase,
  }) : _coinsMarketsRepository = coinsMarketsRepository,
       _favoriteGetUseCase = favoriteGetUseCase,
       _favoriteToggleUseCase = favoriteToggleUseCase {
    fetchCoinsMarkets = Command1(_fetchCoinsMarkets);
    getFavorites = Command1(_getFavorites);
    toggleFavorite = Command1(_toggleFavorite);
  }
  final CoinsMarketsRepository _coinsMarketsRepository;
  final FavoriteGetUseCase _favoriteGetUseCase;
  final FavoriteToggleUseCase _favoriteToggleUseCase;

  late final Command1<void, ({String names, String vsCurrency})>
  fetchCoinsMarkets;
  late final Command1<void, String> getFavorites;
  late final Command1<void, String> toggleFavorite;

  List<Coin> coins = [];
  List<Coin> favoriteCoins = [];
  Timer? _timer;

  Future<Result<void>> _fetchCoinsMarkets(
    ({String names, String vsCurrency}) queryParameters,
  ) async {
    try {
      final (names: names, vsCurrency: vsCurrency) = queryParameters;
      final result = await _coinsMarketsRepository.fetchCoinsMarkets(
        names,
        vsCurrency,
      );
      switch (result) {
        case Ok():
          coins = [...result.value];
          await _getFavorites(vsCurrency);
          return const Result.ok(null);
        case Error():
          log('Error fetching coins markets: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _toggleFavorite(String name) async {
    final result = await _favoriteToggleUseCase.toggleFavorite(name);
    switch (result) {
      case Ok():
        return const Result.ok(null);
      case Error():
        log('Erro ao alterar favorito $name', error: result.error);
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _getFavorites(String vsCurrency) async {
    final result = await _favoriteGetUseCase.getFavorites(vsCurrency);
    switch (result) {
      case Ok():
        favoriteCoins = [...result.value];
        notifyListeners();
        return const Result.ok(null);
      case Error():
        log('Erro ao listar os favoritos', error: result.error);
        return Result.error(result.error);
    }
  }

  void startAutoRefresh(
    ({String names, String vsCurrency}) queryParameters, {
    Duration interval = const Duration(seconds: 70),
  }) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) async {
      await _fetchCoinsMarkets(queryParameters);
    });
  }

  void stopAutoRefresh() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
