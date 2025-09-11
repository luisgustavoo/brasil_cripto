import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CoinsMarketsBackgroundService {
  CoinsMarketsBackgroundService({required HttpClient httpClient})
    : _httpClient = httpClient;
  Isolate? _isolate;
  SendPort? _sendPort;
  final _controller = StreamController<List<CoinsMarketsModel>>.broadcast();
  Stream<List<CoinsMarketsModel>> get coinsMarketsStream => _controller.stream;
  final HttpClient _httpClient;

  Future<void> start(
    ({String? names, String vsCurrency}) queryParameters,
  ) async {
    final (names: names, vsCurrency: vsCurrency) = queryParameters;
    final receivePort = ReceivePort();
    _isolate =
        await Isolate.spawn<
          ({SendPort? sendPort, String? names, String vsCurrency})
        >(
          _coinsMarketsBackground,
          (sendPort: _sendPort, names: names, vsCurrency: vsCurrency),
        );

    receivePort.listen((message) {
      if (message is SendPort) {
        _sendPort?.send(message);
      } else if (message is List<CoinsMarketsModel>) {
        _controller.add(message);
      }
    });
  }

  void stop() {
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    _controller.close();
  }

  Future<void> _coinsMarketsBackground(
    ({SendPort? sendPort, String? names, String vsCurrency}) parameters,
  ) async {
    final (sendPort: sendPort, names: names, vsCurrency: vsCurrency) =
        parameters;
    final port = ReceivePort();
    sendPort?.send(port.sendPort);

    Timer.periodic(const Duration(seconds: 30), (_) async {
      try {
        final result = await _httpClient.get<List<dynamic>>(
          '/coins/markets',
          queryParameters: {
            'vs_currency': vsCurrency,
            'order': 'market_cap_desc',
            'sparkline': true,
            'price_change_percentage': '1h,24h,7d',
            if (names?.isEmpty ?? true) 'per_page': 10,
            if (names?.isEmpty ?? true) 'page': 1,
            'names': names,
          },
        );

        switch (result) {
          case Ok():
            final response = result.value;
            final coinsMarketsList = List<Map<String, dynamic>>.from(
              response.data!,
            );
            final coinsMarkets = coinsMarketsList
                .map(CoinsMarketsModel.fromJson)
                .toList();

            sendPort?.send(coinsMarkets);
          case Error():
            log(
              'Erro ao buscar dados em background',
              error: result.error,
            );
        }
        // if (response.data?.isNotEmpty ?? false) {
        //   final data = response.data!;
        //   final coinsMarketsList = List<Map<String, dynamic>>.from(data);
        //   final coinsMarkets = coinsMarketsList
        //       .map(CoinsMarketsModel.fromJson)
        //       .toList();

        //   sendPort.send(coinsMarkets);
        // }
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
