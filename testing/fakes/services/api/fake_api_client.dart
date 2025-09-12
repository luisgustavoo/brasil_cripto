import 'dart:async';
import 'dart:convert';

import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/api/models/coins_markets_api_model.dart';
import 'package:brasil_cripto/data/services/api/models/market_api_model.dart';
import 'package:brasil_cripto/utils/result.dart';

import '../../../fixture/fixture_reader.dart';

class FakeApiClient implements ApiClient {
  FakeApiClient() {
    final jsonCoinsMarketsData = FixtureReader.getJsonData(
      '/fakes/services/fixture/coins_markets_response.json.json',
    );
    jsonCoinsMarketsResponse =
        jsonDecode(jsonCoinsMarketsData) as List<dynamic>;
    final jsonCoinsMarketsDetailsData = FixtureReader.getJsonData(
      '/fakes/services/fixture/coins_markets_details_response.json.json',
    );
    jsonCoinsMarketsResponse =
        jsonDecode(jsonCoinsMarketsData) as List<dynamic>;
    jsonCoinsMarketsDetailsResponse =
        jsonDecode(jsonCoinsMarketsDetailsData) as Map<String, dynamic>;
  }

  late List<dynamic> jsonCoinsMarketsResponse;
  late Map<String, dynamic> jsonCoinsMarketsDetailsResponse;
  StreamController<List<CoinsMarketsApiModel>> _controller =
      StreamController<List<CoinsMarketsApiModel>>.broadcast();

  @override
  Stream<List<CoinsMarketsApiModel>> get coinsMarketsStream =>
      _controller.stream;

  @override
  Future<Result<List<CoinsMarketsApiModel>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  ) {
    final coinsMarketsList = List<Map<String, dynamic>>.from(
      jsonCoinsMarketsResponse,
    );
    final coinsMarkets = coinsMarketsList
        .map(CoinsMarketsApiModel.fromJson)
        .toList();
    _controller.add(coinsMarkets);
    return Future.value(Result.ok(coinsMarkets));
  }

  @override
  Future<Result<MarketApiModel>> fetchCoinsMarketsDetails(
    String id,
    String vsCurrency,
    int days,
  ) {
    final marketApiModel = MarketApiModel.fromJson(
      jsonCoinsMarketsDetailsResponse,
    );
    return Future.value(Result.ok(marketApiModel));
  }

  @override
  Future<void> startBackGroundFetchCoinsMarkets(
    ({String? names, String vsCurrency}) queryParameters,
  ) async {
    if (_controller.isClosed) {
      _controller = StreamController<List<CoinsMarketsApiModel>>.broadcast();
    }
  }

  @override
  void stopBackGroundFetchCoinsMarkets() {
    _controller.close();
  }
}
