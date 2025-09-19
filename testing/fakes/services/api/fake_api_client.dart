import 'dart:async';

import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/api/models/coins_markets_api_model.dart';
import 'package:brasil_cripto/data/services/api/models/market_api_model.dart';
import 'package:brasil_cripto/utils/result.dart';

import '../../../models/coin.dart';
import '../../../models/market.dart';

class FakeApiClient implements ApiClient {
  int requestCount = 0;
  @override
  Future<Result<List<CoinsMarketsApiModel>>> fetchCoinsMarkets(
    String vsCurrency, {
    String? ids,
    String? names,
  }) {
    requestCount++;
    return Future.value(const Result.ok([kCoinsMarketsApiModel]));
  }

  @override
  Future<Result<MarketApiModel>> fetchCoinsMarketsChart({
    required String id,
    required String vsCurrency,
    required int days,
  }) {
    requestCount++;
    return Future.value(const Result.ok(kMarketApiModel));
  }
}
