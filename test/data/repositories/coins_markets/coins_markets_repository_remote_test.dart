import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository_remote.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late FakeApiClient apiClient;
  late CoinsMarketsRepository coinsMarketsRepository;

  setUp(() {
    apiClient = FakeApiClient();
    coinsMarketsRepository = CoinsMarketsRepositoryRemote(
      apiClient: apiClient,
    );
  });
  group('CoinsMarketsRepository', () {
    test(
      'should return a list of coins when fetching markets succeeds',
      () async {
        final result = await coinsMarketsRepository.fetchCoinsMarkets(
          'usd',
          names: 'Bitcoin',
        );
        expect(result, isA<Ok<List<Coin>>>());
        expect(result.asOk.value.isNotEmpty, true);
        expect(result.asOk.value.first.id.toLowerCase(), 'bitcoin');
        expect(apiClient.requestCount, 1);
      },
    );
    test(
      'should return market details when fetching market chart succeeds',
      () async {
        final result = await coinsMarketsRepository.fetchCoinsMarketsChart(
          vsCurrency: 'usd',
          id: 'bitcoin',
          days: 1,
        );
        expect(result, isA<Ok<Market>>());
        expect(result.asOk.value.prices, isNotNull);
        expect(result.asOk.value.totalVolumes, isNotNull);
        expect(result.asOk.value.marketCaps, isNotNull);
        expect(apiClient.requestCount, 1);
      },
    );
  });
}
