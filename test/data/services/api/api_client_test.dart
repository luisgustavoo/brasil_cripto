import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/mocks.dart';
import '../../../../testing/models/coin.dart';
import '../../../../testing/models/market.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ApiClient apiClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiClient = ApiClient(httpClient: mockHttpClient);
  });

  group('ApiClient fetchCoinsMarkets', () {
    test(
      'should return a non-empty list when coins markets API returns data',
      () async {
        mockHttpClient.mockGet<List<dynamic>>(
          '/coins/markets',
          object: [kCoinsMarketsApiModel.toJson()],
        );

        final result = await apiClient.fetchCoinsMarkets(
          'usd',
          names: 'Bitcoin',
        );
        expect(result.asOk.value, isNotEmpty);
      },
    );
    test(
      'should return a empty list when coins markets API returns data',
      () async {
        mockHttpClient.mockGet<List<dynamic>>(
          '/coins/markets',
        );

        final result = await apiClient.fetchCoinsMarkets(
          'usd',
          names: 'Bitcoin',
        );
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

        final result = await apiClient.fetchCoinsMarkets(
          'usd',
          names: 'Bitcoin',
        );
        expect(result, result.asError);
      },
    );
  });

  group('ApiClient fetchCoinsMarketsDetails', () {
    const id = 'bitcoin';
    test(
      'should return Ok when coins market details API request succeeds',
      () async {
        mockHttpClient.mockGet<Map<String, dynamic>>(
          '/coins/$id/market_chart',
          object: kMarketApiModel.toJson(),
        );
        final result = await apiClient.fetchCoinsMarketsChart(
          id: id,
          vsCurrency: 'usd',
          days: 1,
        );
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

        final result = await apiClient.fetchCoinsMarketsChart(
          id: id,
          vsCurrency: 'usd',
          days: 1,
        );
        expect(result, result.asError);
      },
    );
  });
}
