import 'dart:convert';

import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fixture/fixture_reader.dart';
import '../../../../testing/mocks.dart';
import '../../../../testing/utils/result.dart';

void main() {
  group('api client ...', () async {
    late MockHttpClient mockHttpClient;
    late ApiClient apiClient;
    late List<dynamic> jsonCoinsMarketsResponse;

    setUp(() {
      mockHttpClient = MockHttpClient();
      apiClient = ApiClient(httpClient: mockHttpClient);
      final jsonCoinsMarketsData = FixtureReader.getJsonData(
        '/fakes/services/fixture/coins_markets_response.json.json',
      );
      jsonCoinsMarketsResponse =
          jsonDecode(jsonCoinsMarketsData) as List<dynamic>;
    });

    test(
      'fadfafds',
      () async {
        mockHttpClient.mockGet<List<dynamic>>(
          '/coins/markets',
          jsonCoinsMarketsResponse,
        );

        final result = await apiClient.fetchCoinsMarkets('Bitcoin', 'usd');
        expect(result.asOk.value, isNotEmpty);
      },
    );
  });
}
