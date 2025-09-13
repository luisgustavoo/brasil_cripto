import 'dart:developer';

import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CoinsMarketViewModel extends ChangeNotifier {
  CoinsMarketViewModel({
    required CoinsMarketsRepository coinsMarketsRepository,
  }) : _coinsMarketsRepository = coinsMarketsRepository {
    fetchCoinsMarkets = Command1(_fetchCoinsMarkets);
  }
  final CoinsMarketsRepository _coinsMarketsRepository;

  Stream<List<Coin>> get coinsMarketsStream =>
      _coinsMarketsRepository.coinsMarketsStream;

  late final Command1<void, ({String names, String vsCurrency})>
  fetchCoinsMarkets;
  late final Command1<void, Coin> toggleFavorite;

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
          return const Result.ok(null);
        case Error():
          log('Error fetching coins markets: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }
}
