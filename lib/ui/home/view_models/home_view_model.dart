import 'dart:developer';

import 'package:brasil_cripto/data/repositories/coins_markets_repository.dart';
import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required CoinsMarketsRepository coinsMarketsRepository})
    : _coinsMarketsRepository = coinsMarketsRepository {
    fetchCoinsMarkets = Command1(_fetchCoinsMarkets);
  }
  final CoinsMarketsRepository _coinsMarketsRepository;

  Stream<List<CoinsMarkets>> get coinsMarketsStream =>
      _coinsMarketsRepository.coinsMarketsStream;

  late final Command1<void, ({String names, String vsCurrency})>
  fetchCoinsMarkets;

  Future<Result<void>> _fetchCoinsMarkets(
    ({String names, String vsCurrency}) queryParameters,
  ) async {
    final (names: names, vsCurrency: vsCurrency) = queryParameters;
    notifyListeners();
    final result = await _coinsMarketsRepository.fetchCoinsMarkets(
      names,
      vsCurrency,
    );
    switch (result) {
      case Ok():
        notifyListeners();
        return const Result.ok(null);
      case Error():
        log('Error fetching coins markets: ${result.error}');
        notifyListeners();
        return Result.error(result.error);
    }
  }
}
