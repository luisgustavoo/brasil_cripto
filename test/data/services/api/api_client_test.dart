import 'dart:convert';

import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fixture/fixture_reader.dart';
import '../../../../testing/mocks.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ApiClient apiClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiClient = ApiClient(httpClient: mockHttpClient);
  });

  group('ApiClient fetchCoinsMarkets', () {
    late List<dynamic> jsonCoinsMarketsResponse;
    final jsonCoinsMarketsData = FixtureReader.getJsonData(
      'fakes/services/fixture/coins_markets_response.json',
    );
    jsonCoinsMarketsResponse =
        jsonDecode(jsonCoinsMarketsData) as List<dynamic>;

    test(
      'should return a non-empty list when coins markets API returns data',
      () async {
        mockHttpClient.mockGet<List<dynamic>>(
          '/coins/markets',
          object: jsonCoinsMarketsResponse,
        );

        final result = await apiClient.fetchCoinsMarkets('Bitcoin', 'usd');
        expect(result.asOk.value, isNotEmpty);
      },
    );
    test(
      'should return a empty list when coins markets API returns data',
      () async {
        mockHttpClient.mockGet<List<dynamic>>(
          '/coins/markets',
        );

        final result = await apiClient.fetchCoinsMarkets('Bitcoin', 'usd');
        expect(result.asOk.value, isEmpty);
      },
    );

    test(
      'should return an error when coins markets API request fails',
      () async {
        mockHttpClient.mockGet<List<dynamic>>(
          '/coins/markets',
          showError: true,
        );

        final result = await apiClient.fetchCoinsMarkets('Bitcoin', 'usd');
        expect(result, result.asError);
      },
    );
  });

  group('ApiClient fetchCoinsMarketsDetails', () {
    final jsonCoinsMarketsDetailsData = FixtureReader.getJsonData(
      'fakes/services/fixture/coins_markets_details_response.json',
    );
    final jsonCoinsMarketsDetailsResponse =
        jsonDecode(jsonCoinsMarketsDetailsData) as Map<String, dynamic>;

    const id = 'bitcoin';
    test(
      'should return Ok when coins market details API request succeeds',
      () async {
        mockHttpClient.mockGet<Map<String, dynamic>>(
          '/coins/$id/market_chart',
          object: jsonCoinsMarketsDetailsResponse,
        );

        final result = await apiClient.fetchCoinsMarketsDetails(id, 'usd', 1);
        expect(result, isA<Ok<void>>());
      },
    );

    test(
      'should return Error when coins market details API request fails',
      () async {
        mockHttpClient.mockGet<Map<String, dynamic>>(
          '/coins/$id/market_chart',
          showError: true,
        );

        final result = await apiClient.fetchCoinsMarketsDetails(id, 'usd', 1);
        expect(result, result.asError);
      },
    );
  });
}
