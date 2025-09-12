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

  Market? market;
  late final Command1<void, ({String id, String vsCurrency})>
  fetchCoinsMarketsDetails;
  Future<Result<void>> _fetchCoinsMarketsDetails(
    ({String id, String vsCurrency}) queryParameters,
  ) async {
    final (id: id, vsCurrency: vsCurrency) = queryParameters;
    final result = await _coinsMarketsRepository.fetchCoinsMarketsDetails(
      id,
      vsCurrency,
      1,
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
