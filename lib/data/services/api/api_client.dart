import 'dart:async';

import 'package:brasil_cripto/data/services/api/models/coins_markets_api_model.dart';
import 'package:brasil_cripto/data/services/api/models/market_api_model.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiClient {
  ApiClient({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;
  final HttpClient _httpClient;

  Future<Result<List<CoinsMarketsApiModel>>> fetchCoinsMarkets(
    String vsCurrency, {
    String? ids,
    String? names,
  }) async {
    try {
      final response = await _httpClient.auth().get<List<dynamic>>(
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

      if (response.data?.isNotEmpty ?? false) {
        final coinsMarketsList = List<Map<String, dynamic>>.from(
          response.data!,
        );
        final coinsMarkets = coinsMarketsList
            .map(CoinsMarketsApiModel.fromJson)
            .toList();
        return Result.ok(coinsMarkets);
      } else {
        return const Result.ok(<CoinsMarketsApiModel>[]);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<MarketApiModel>> fetchCoinsMarketsChart({
    required String id,
    required String vsCurrency,
    required int days,
  }) async {
    try {
      final response = await _httpClient.auth().get<Map<String, dynamic>>(
        '/coins/$id/market_chart',
        queryParameters: {
          'vs_currency': vsCurrency,
          'days': days,
        },
      );

      if (response.data?.isNotEmpty ?? false) {
        return Result.ok(MarketApiModel.fromJson(response.data!));
      } else {
        return Result.error(Exception('Dados não encontrados'));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
