import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:brasil_cripto/config/env.dart';
import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:dio/dio.dart';
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
    _isolate = await Isolate.spawn<_IsolateParams>(
      _coinsMarketsBackground,
      _IsolateParams(
        sendPort: receivePort.sendPort,
        names: names,
        vsCurrency: vsCurrency,
      ),
      // (
      //   sendPort: receivePort.sendPort,
      //   names: names,
      //   vsCurrency: vsCurrency,
      // ),
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
}

class _IsolateParams {
  _IsolateParams({
    required this.sendPort,
    required this.names,
    required this.vsCurrency,
  });

  final SendPort sendPort;
  final String? names;
  final String vsCurrency;
}

void _coinsMarketsBackground(_IsolateParams params) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      headers: {
        'x-cg-demo-api-key': Env.coingeckoApiKey,
      },
    ),
  );

  Timer.periodic(const Duration(seconds: 30), (_) async {
    try {
      final topTen = params.names?.isEmpty ?? true;

      final response = await dio.get<List<dynamic>>(
        '/coins/markets',
        queryParameters: {
          'vs_currency': params.vsCurrency,
          'order': 'market_cap_desc',
          'sparkline': true,
          'price_change_percentage': '1h,24h,7d',
          if (topTen) 'per_page': 10,
          if (topTen) 'page': 1,
          'names': params.names?.toLowerCase(),
        },
      );

      if (response.data != null) {
        log('Background data ${response.data}');
        params.sendPort.send(response.data);
      }
    } on Exception catch (e, s) {
      log('Erro no isolate', error: e, stackTrace: s);
    }
  });
}
