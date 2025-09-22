import 'dart:async';
import 'dart:developer';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/domain/models/sparkline.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CoinsMarketsRepository)
class CoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  CoinsMarketsRepositoryRemote({
    required ApiClient apiClient,
    required SharedPreferencesService preferencesService,
  }) : _apiClient = apiClient,
       _preferencesService = preferencesService;

  final ApiClient _apiClient;
  final SharedPreferencesService _preferencesService;
  late List<String> _ids = [];
  StreamController<List<Coin>>? _controller;
  Timer? _timer;
  String vsCurrency = 'brl';
  String? names;

  Future<void> _getIds() async {
    final result = await _preferencesService.getData();
    switch (result) {
      case Ok():
        _ids = [...?result.value];
      case Error():
        log('Erro ao buscar ids dos favoritos');
    }
  }

  void _start({Duration interval = const Duration(seconds: 60)}) {
    if (_timer != null) {
      return;
    }
    if (_controller?.isClosed ?? true) {
      _controller = StreamController<List<Coin>>();
    }
    _timer = Timer.periodic(interval, (_) async {
      final result = await fetchCoinsMarkets(
        vsCurrency,
        names: names,
      );
      switch (result) {
        case Ok():
          log('####### REFRESH DATA(CoinsMarketsRepositoryRemote) #######');
          _controller?.add(result.value);
        case Error():
          log('Erro ao buscar dados dos favoritos', error: result.error);
      }
    });
  }

  void _stop() {
    _controller?.close();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Stream<List<Coin>>? get coins => _controller?.stream;

  @override
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String vsCurrency, {
    String? names,
  }) async {
    this.names = names;
    this.vsCurrency = vsCurrency;
    await _getIds();
    try {
      final result = await _apiClient.fetchCoinsMarkets(
        vsCurrency,
        names: names,
      );
      switch (result) {
        case Ok():
          final coinsMarketsList = result.value.map(
            (coin) {
              return Coin(
                id: coin.id,
                symbol: coin.symbol,
                name: coin.name,
                image: coin.image,
                currentPrice: coin.currentPrice,
                marketCap: coin.marketCap,
                marketCapRank: coin.marketCapRank,
                totalVolume: coin.totalVolume,
                sparkLineIn7d: Sparkline(
                  price: coin.sparkLineIn7d.price,
                ),
                priceChangePercentage1hInCurrency:
                    coin.priceChangePercentage1hInCurrency,
                priceChangePercentage24hInCurrency:
                    coin.priceChangePercentage24hInCurrency,
                priceChangePercentage7dInCurrency:
                    coin.priceChangePercentage7dInCurrency,
                isFavorite: _ids.any((id) => id == coin.id),
              );
            },
          ).toList();
          return Result.ok(coinsMarketsList);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Market>> fetchCoinsMarketsChart({
    required String id,
    required String vsCurrency,
    required int days,
  }) async {
    try {
      final result = await _apiClient.fetchCoinsMarketsChart(
        id: id,
        vsCurrency: vsCurrency,
        days: 1,
      );
      switch (result) {
        case Ok():
          return Result.ok(
            Market(
              prices: result.value.prices,
              totalVolumes: result.value.totalVolumes,
              marketCaps: result.value.marketCaps,
            ),
          );
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  void starPollingService() {
    _start();
  }

  @override
  void stopPollingService() {
    _stop();
  }
}
