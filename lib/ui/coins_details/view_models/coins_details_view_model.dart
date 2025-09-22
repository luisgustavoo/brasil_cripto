import 'dart:developer';

import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CoinsDetailsViewModel extends ChangeNotifier {
  CoinsDetailsViewModel({
    required CoinsMarketsRepository coinsMarketsRepository,
  }) : _coinsMarketsRepository = coinsMarketsRepository {
    fetchCoinsMarketsDetails = Command1(_fetchCoinsMarketsDetails);
  }
  final CoinsMarketsRepository _coinsMarketsRepository;

  late final Command1<void, String> fetchCoinsMarketsDetails;
  Market? market;
  String vsCurrency = 'brl';

  Future<Result<void>> _fetchCoinsMarketsDetails(String id) async {
    final result = await _coinsMarketsRepository.fetchCoinsMarketsChart(
      id: id,
      vsCurrency: vsCurrency,
      days: 1,
    );
    switch (result) {
      case Ok():
        market = result.value;
        notifyListeners();
        return const Result.ok(null);
      case Error():
        log('Erro ao buscar detalhes da moeda $id', error: result.error);
        notifyListeners();
        return Result.error(result.error);
    }
  }
}
