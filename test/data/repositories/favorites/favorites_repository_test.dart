import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/sparkline.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/utils/result.dart';

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

  group('FavoritesRepository', () {
    test('should emit updated favorites when a coin is toggled', () async {
      // Lista para capturar valores emitidos pela stream
      final emittedFavorites = <Coin>[];
      final subscription = favoritesRepository.favoritesStream.listen(
        emittedFavorites.addAll,
      );
      final result = await favoritesRepository.toggleFavorite(kCoin);
      // Dá tempo da stream emitir o valor
      await Future<void>.delayed(Duration.zero);
      expect(result, isA<Ok<void>>());
      expect(emittedFavorites.length, 1);
      expect(emittedFavorites.first.id, 'bitcoin');
      await subscription.cancel();
    });
    test('should add coin to favorites and retrieve it', () async {
      final toggleResult = await favoritesRepository.toggleFavorite(kCoin);
      expect(toggleResult, isA<Ok<void>>());
      final result = await favoritesRepository.getFavorites();
      expect(result, isA<Ok<List<Coin>>>());
      final favorites = result.asOk.value;
      expect(favorites.isNotEmpty, true);
      expect(favorites.first.id, 'bitcoin');
    });
  });
}
