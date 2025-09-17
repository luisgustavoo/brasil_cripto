import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository_remote.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late CoinsMarketsRepository coinsMarketsRepository;

  setUp(() {
    coinsMarketsRepository = CoinsMarketsRepositoryRemote(
      apiClient: FakeApiClient(),
    );
  });
  group('CoinsMarketsRepository remote', () {
    test('should fetch coin markets successfully', () async {
      final result = await coinsMarketsRepository.fetchCoinsMarkets(
        'Bitcoin',
        'usd',
      );
      expect(result, isA<Ok<List<Coin>>>());
      expect(result.asOk.value.isNotEmpty, true);
      expect(result.asOk.value.first.id.toLowerCase(), 'bitcoin');
    });
    test('should fetch coin market details successfully', () async {
      final result = await coinsMarketsRepository.fetchCoinsMarketsChart(
        'Bitcoin',
        'usd',
        1,
      );
      expect(result, isA<Ok<Market>>());
      expect(result.asOk.value.prices, isNotNull);
      expect(result.asOk.value.totalVolumes, isNotNull);
      expect(result.asOk.value.marketCaps, isNotNull);
    });
  });
}
