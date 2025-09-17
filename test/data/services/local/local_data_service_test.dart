import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/sparkline.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late LocalDataService localDataService;
  final fakeSharedPreferencesService = FakeSharedPreferencesService();

  final kCoin = [
    Coin(
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
    ),
  ];
  Map<String, dynamic> sparklineToMap(Sparkline model) {
    return {
      'price': model.price,
    };
  }

  List<Map<String, dynamic>> coinsToMap(List<Coin> coins) {
    return coins.map(
      (coin) {
        return {
          'id': coin.id,
          'symbol': coin.symbol,
          'name': coin.name,
          'image': coin.image,
          'current_price': coin.currentPrice,
          'market_cap': coin.marketCap,
          'market_cap_rank': coin.marketCapRank,
          'fully_diluted_valuation': coin.fullyDilutedValuation,
          'total_volume': coin.totalVolume,
          'sparkline_in_7d': sparklineToMap(coin.sparkLineIn7d),
          'price_change_percentage_1h_in_currency':
              coin.priceChangePercentage1hInCurrency,
          'price_change_percentage_24h_in_currency':
              coin.priceChangePercentage24hInCurrency,
          'price_change_percentage_7d_in_currency':
              coin.priceChangePercentage7dInCurrency,
        };
      },
    ).toList();
  }

  setUp(() {
    localDataService = LocalDataService(
      sharedPreferencesService: fakeSharedPreferencesService,
    );
  });

  group('LocalDataService', () {
    test(
      'should add a coin to favorites successfully',
      () async {
        final result = await localDataService.addFavorite(['Bitcoin']);
        expect(result, isA<Ok<void>>());
      },
    );
    test(
      'should add and retrieve favorites',
      () async {
        final addResult = await localDataService.addFavorite(['Bitcoin']);
        expect(addResult, isA<Ok<void>>());
        final result = await localDataService.getFavorites();
        expect(result, isA<Ok<List<Coin>>>());
        final favorites = result.asOk.value;
        expect(favorites.isNotEmpty, true);
      },
    );
  });
}
