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
      'fakes/services/fixture/coins_markets_response.json',
    );
    jsonCoinsMarketsResponse =
        jsonDecode(jsonCoinsMarketsData) as List<dynamic>;
    final jsonCoinsMarketsDetailsData = FixtureReader.getJsonData(
      'fakes/services/fixture/coins_markets_details_response.json',
    );
    jsonCoinsMarketsResponse =
        jsonDecode(jsonCoinsMarketsData) as List<dynamic>;
    jsonCoinsMarketsDetailsResponse =
        jsonDecode(jsonCoinsMarketsDetailsData) as Map<String, dynamic>;
  }

  late List<dynamic> jsonCoinsMarketsResponse;
  late Map<String, dynamic> jsonCoinsMarketsDetailsResponse;
  StreamController<List<CoinsMarketsApiModel>> _favoritesCoinsController =
      StreamController<List<CoinsMarketsApiModel>>();
  StreamController<List<CoinsMarketsApiModel>> _coinsMarketsController =
      StreamController<List<CoinsMarketsApiModel>>();

  @override
  Stream<List<CoinsMarketsApiModel>> get coinsMarketsStream =>
      _coinsMarketsController.stream;

  @override
  Future<Result<List<CoinsMarketsApiModel>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency, {
    bool isFavorite = false,
  }) {
    final coinsMarketsList = List<Map<String, dynamic>>.from(
      jsonCoinsMarketsResponse,
    );
    final coinsMarkets = coinsMarketsList
        .map(CoinsMarketsApiModel.fromJson)
        .toList();
    _coinsMarketsController
      ..add(coinsMarkets)
      ..close();
    return Future.value(Result.ok(coinsMarkets));
  }

  @override
  Future<Result<MarketApiModel>> fetchCoinsMarketsChart(
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
  Future<void> startBackGroundFetchCoinsMarkets({
    required String vsCurrency,
    String? names,
  }) async {
    if (_coinsMarketsController.isClosed) {
      _coinsMarketsController = StreamController<List<CoinsMarketsApiModel>>();
    }
  }

  @override
  void stopBackGroundFetch() {
    _coinsMarketsController.close();
    _favoritesCoinsController.close();
  }

  @override
  Stream<List<CoinsMarketsApiModel>> get favoriteCoinsMarketStream =>
      _favoritesCoinsController.stream;

  @override
  Future<void> startBackGroundFetchFavoritesCoins({
    required String vsCurrency,
    String? names,
  }) async {
    if (_favoritesCoinsController.isClosed) {
      _favoritesCoinsController =
          StreamController<List<CoinsMarketsApiModel>>();
    }
  }

  @override
  void stopBackGroundFetchCoinsMarkets() {
    _favoritesCoinsController.close();
  }

  @override
  void stopBackGroundFetchFavoritesCoinsMarkets() {
    _favoritesCoinsController.close();
  }
}
