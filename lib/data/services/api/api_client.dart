import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiClient {
  ApiClient({required HttpClient httpClient}) : _httpClient = httpClient;
  final HttpClient _httpClient;
  Isolate? _isolate;
  StreamController<List<CoinsMarketsModel>> _controller =
      StreamController<List<CoinsMarketsModel>>.broadcast();
  Stream<List<CoinsMarketsModel>> get coinsMarketsStream => _controller.stream;

  Future<Result<List<CoinsMarketsModel>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  ) async {
    try {
      final result = await _httpClient.auth().get<List<dynamic>>(
        '/coins/markets',
        queryParameters: {
          'vs_currency': vsCurrency,
          'order': 'market_cap_desc',
          'sparkline': true,
          'price_change_percentage': '1h,24h,7d',
          if (names?.isEmpty ?? true) 'per_page': 10,
          if (names?.isEmpty ?? true) 'page': 1,
          'names': names,
          // 'names': 'bitcoin,ethereum,binancecoin,ripple,cardano,dogecoin,polkadot,solana,tron,litecoin,uniswap,chainlink,wrapped-bitcoin,stellar,bitcoin-cash,vechain,filecoin,theta-network,eos,monero,aave,tezos,cosmos,iota,fantom,kusama,elrond-erd-2,nem,zcash,decred,celo,harmony,maker,sushi,compound-governance-token,enjincoin,basic-attention-token',
        },
      );

      switch (result) {
        case Ok():
          final data = result.value.data;
          if (data?.isNotEmpty ?? false) {
            final coinsMarketsList = List<Map<String, dynamic>>.from(data!);
            final coinsMarkets = coinsMarketsList
                .map(CoinsMarketsModel.fromJson)
                .toList();
            return Result.ok(coinsMarkets);
          } else {
            return const Result.ok(<CoinsMarketsModel>[]);
          }
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<void> startBackGroundFetchCoinsMarkets(
    ({String? names, String vsCurrency}) queryParameters,
  ) async {
    stopBackGroundFetchCoinsMarkets();
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

  void stopBackGroundFetchCoinsMarkets() {
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
