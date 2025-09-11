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
    fetchCoinsMarkets = Command0(_fetchCoinsMarkets)..execute();
  }
  final CoinsMarketsRepository _coinsMarketsRepository;

  List<CoinsMarkets> coinsMarkets = [];

  late final Command0<void> fetchCoinsMarkets;

  Future<Result<void>> _fetchCoinsMarkets() async {
    notifyListeners();
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
