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
  }
  final CoinsMarketsRepository _coinsMarketsRepository;

  late final Command1<void, ({String names, String vsCurrency})>
  fetchCoinsMarkets;
  List<Coin> coins = [];
  Timer? _timer;

  Future<Result<void>> _fetchCoinsMarkets(
    ({String names, String vsCurrency}) queryParameters,
  ) async {
    final (names: names, vsCurrency: vsCurrency) = queryParameters;
    final result = await _coinsMarketsRepository.fetchCoinsMarkets(
      names,
      vsCurrency,
    );
    switch (result) {
      case Ok():
        coins = [...result.value];
        notifyListeners();
        return const Result.ok(null);
      case Error():
        log('Error fetching coins markets: ${result.error}');
        notifyListeners();
        return Result.error(result.error);
    }
  }

  void startAutoRefresh(
    ({String names, String vsCurrency}) queryParameters, {
    Duration interval = const Duration(seconds: 70),
  }) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) async {
      // await fetchCoinsMarkets.execute(queryParameters);
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
