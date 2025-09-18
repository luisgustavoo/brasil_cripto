import 'dart:async';
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
    toggleFavorite = Command1(_toggleFavorite);
  }
  final CoinsMarketsRepository _coinsMarketsRepository;

  late final Command1<void, ({String names, String vsCurrency})>
  fetchCoinsMarkets;
  late final Command1<void, String> toggleFavorite;

  List<Coin> coins = [];

  Future<Result<void>> _fetchCoinsMarkets(
    ({String names, String vsCurrency}) queryParameters,
  ) async {
    return Result.ok(null);
  }

  Future<Result<void>> _toggleFavorite(String name) async {
    return Result.ok(null);
  }
}
