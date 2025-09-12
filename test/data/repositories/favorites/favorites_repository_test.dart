import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/sparkline.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';

void main() {
  late FavoritesRepository favoritesRepository;
  final kCoin = Coin(
    id: 'bitcoin',
    symbol: 'btc',
    name: 'Bitcoin',
    image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
    currentPrice: 69702.30,
    marketCap: 1300000000000,
    marketCapRank: 1,
    fullyDilutedValuation: 1400000000000,
    totalVolume: 25000000000,
    sparkLineIn7d: Sparkline(price: [68000, 69000, 70000, 71000]),
    priceChangePercentage1hInCurrency: 0.2,
    priceChangePercentage24hInCurrency: -1.1,
    priceChangePercentage7dInCurrency: 5.4,
  );

  setUp(() {
    favoritesRepository = FavoritesRepository(
      localDataService: LocalDataService(
        sharedPreferences: FakeSharedPreferencesService(),
      ),
    );
  });

  group('favorites repository ...', () {
    test('1', () {
      final result = favoritesRepository.toggleFavorite(kCoin);
      expect(result, isA<Ok<void>>());
    });
  });
}
