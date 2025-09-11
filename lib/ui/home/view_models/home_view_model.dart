import 'dart:developer';

import 'package:brasil_cripto/data/repositories/coins_markets_repository.dart';
import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required CoinsMarketsRepository coinsMarketsRepository})
    : _coinsMarketsRepository = coinsMarketsRepository;
  final CoinsMarketsRepository _coinsMarketsRepository;

  List<CoinsMarkets> coinsMarkets = [];

  Future<Result<void>> fetchCoinsMarkets() async {
    final result = await _coinsMarketsRepository.fetchCoinsMarkets();
    switch (result) {
      case Ok():
        coinsMarkets = result.value;
        notifyListeners();
        return const Result.ok(null);
      case Error():
        log('Error fetching coins markets: ${result.error}');
        notifyListeners();
        return Result.error(result.error);
    }
  }
}
