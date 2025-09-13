import 'dart:async';
import 'dart:developer';

import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/sparkline.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoritesRepository {
  FavoritesRepository({required LocalDataService localDataService})
    : _localDataService = localDataService {
    unawaited(_init());
  }
  final LocalDataService _localDataService;

  List<Coin> favoritesCoins = <Coin>[];

  Future<void> _init() async {
    favoritesCoins.clear();
    await getFavorites();
  }

  Future<Result<void>> toggleFavorite(Coin coin) async {
    final coinFound = favoritesCoins.firstWhereOrNull(
      (element) => element.id == coin.id,
    );
    if (coinFound != null) {
      _removeFavorites(coin);
    } else {
      _addFavorites(coin);
    }
    return _localDataService.addFavorite(coinsToMap(favoritesCoins));
  }

  Future<Result<List<Coin>>> getFavorites() async {
    final result = await _localDataService.getFavorites();

    switch (result) {
      case Ok():
        favoritesCoins = result.value;
        return Result.ok(result.value);
      case Error():
        log('Erro ao inicializar favoritos', error: result.error);
        return Result.error(result.error);
    }
  }

  void _addFavorites(Coin coin) {
    favoritesCoins.add(coin);
  }

  void _removeFavorites(Coin coin) {
    favoritesCoins.removeWhere(
      (element) => element.id == coin.id,
    );
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

  Map<String, dynamic> sparklineToMap(Sparkline model) {
    return {
      'price': model.price,
    };
  }
}
