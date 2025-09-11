import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CoinsMarketsBackgroundService {
  CoinsMarketsBackgroundService({required HttpClient httpClient})
    : _httpClient = httpClient;
  Isolate? _isolate;
  StreamController<List<CoinsMarketsModel>> _controller =
      StreamController<List<CoinsMarketsModel>>.broadcast();
  Stream<List<CoinsMarketsModel>> get coinsMarketsStream => _controller.stream;
  final HttpClient _httpClient;

  Future<void> start(
    ({String? names, String vsCurrency}) queryParameters,
  ) async {
    stop();
    log('Background service start');
    if (_controller.isClosed) {
      _controller = StreamController<List<CoinsMarketsModel>>.broadcast();
    }
    final (names: names, vsCurrency: vsCurrency) = queryParameters;
    final receivePort = ReceivePort();
    _isolate =
        await Isolate.spawn<
          ({SendPort? sendPort, String? names, String vsCurrency})
        >(
          _coinsMarketsBackground,
          (
            sendPort: receivePort.sendPort,
            names: names,
            vsCurrency: vsCurrency,
          ),
        );

    receivePort.listen((message) {
      if (message is List<dynamic>) {
        final coinsMarketsList = List<Map<String, dynamic>>.from(
          message,
        );

        final coinsMarkets = coinsMarketsList
            .map(CoinsMarketsModel.fromJson)
            .toList();
        _controller.add(coinsMarkets);
      }
    });
  }

  void stop() {
    log('Background service stop');
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    _controller.close();
  }

  Future<void> _coinsMarketsBackground(
    ({SendPort? sendPort, String? names, String vsCurrency}) parameters,
  ) async {
    final (sendPort: sendPort, names: names, vsCurrency: vsCurrency) =
        parameters;

    Timer.periodic(const Duration(seconds: 30), (_) async {
      try {
        final topTen = names?.isEmpty ?? true;
        final result = await _httpClient.get<List<dynamic>>(
          '/coins/markets',
          queryParameters: {
            'vs_currency': vsCurrency,
            'order': 'market_cap_desc',
            'sparkline': true,
            'price_change_percentage': '1h,24h,7d',
            if (topTen) 'per_page': 10,
            if (topTen) 'page': 1,
            'names': names,
          },
        );

        switch (result) {
          case Ok():
            final response = result.value;
            sendPort?.send(response.data);
          case Error():
            log(
              'Erro ao buscar dados em background',
              error: result.error,
            );
        }
      } on Exception catch (e, s) {
        log(
          'Erro ao buscar dados em background',
          error: e,
          stackTrace: s,
        );
      }
    });
  }
}
