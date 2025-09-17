import 'dart:async';

import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/api/models/coins_markets_api_model.dart';
import 'package:brasil_cripto/data/services/api/models/market_api_model.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

import '../../../models/coin.dart';
import '../../../models/market.dart';

@Injectable(as: ApiClient, env: [Environment.test])
class FakeApiClient implements ApiClient {
  @override
  Future<Result<List<CoinsMarketsApiModel>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency, {
    bool isFavorite = false,
  }) {
    return Future.value(Result.ok(kCoinsMarketsApiModel));
  }

  @override
  Future<Result<MarketApiModel>> fetchCoinsMarketsChart(
    String id,
    String vsCurrency,
    int days,
  ) {
    return Future.value(Result.ok(kMarketApiModel));
  }
}
