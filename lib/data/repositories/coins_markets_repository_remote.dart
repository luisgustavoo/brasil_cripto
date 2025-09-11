import 'dart:async';

import 'package:brasil_cripto/data/repositories/coins_markets_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/background/coins_markets_background_service.dart';
import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CoinsMarketsRepository)
class CoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  CoinsMarketsRepositoryRemote({
    required ApiClient apiClient,
    required CoinsMarketsBackgroundService coinsMarketsBackgroundService,
  }) : _apiClient = apiClient,
       _coinsMarketsBackgroundService = coinsMarketsBackgroundService;

  final ApiClient _apiClient;
  final CoinsMarketsBackgroundService _coinsMarketsBackgroundService;
  final _coinsMarketsController =
      StreamController<List<CoinsMarkets>>.broadcast();

  @override
  Stream<List<CoinsMarkets>> get coinsMarketsStream =>
      _coinsMarketsController.stream;

  @override
  Future<Result<List<CoinsMarkets>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  ) async {
    try {
      final result = await _apiClient.fetchCoinsMarkets(names, vsCurrency);
      switch (result) {
        case Ok():
          final coinsMarketsList = result.value
              .map(CoinsMarkets.fromApi)
              .toList();
          _coinsMarketsController.add(coinsMarketsList);
          await _addListener(names, vsCurrency);
          return Result.ok(coinsMarketsList);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<void> _addListener(
    String? names,
    String vsCurrency,
  ) async {
    await _coinsMarketsBackgroundService.start(
      (
        names: names,
        vsCurrency: vsCurrency,
      ),
    );

    _coinsMarketsBackgroundService.coinsMarketsStream.listen(
      (event) {
        final coinsMarketsList = event.map(CoinsMarkets.fromApi).toList();
        _coinsMarketsController.add(coinsMarketsList);
      },
    );
  }

  @override
  Future<Result<void>> closeBackgroundService() async {
    _coinsMarketsBackgroundService.stop();
    return const Result.ok(null);
  }
}
