import 'dart:async';
import 'dart:developer';

import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
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

  late final _favoriteStreamController = StreamController<List<Coin>>();
  final _favoritesCoins = <Coin>[];

  Stream<List<Coin>> get favoritesStream => _favoriteStreamController.stream;

  Future<void> _init() async {
    final result = await _localDataService.getFavorites();

    switch (result) {
      case Ok():
        _favoriteStreamController.add(result.value);
        _favoritesCoins.addAll(result.value);
      case Error():
        log('Erro ao inicializar favoritos', error: result.error);
        _favoriteStreamController.add(const []);
    }
  }

  Future<Result<void>> toggleFavorite(Coin coin) async {
    final coinFound = _favoritesCoins.firstWhereOrNull(
      (element) => element.id == coin.id,
    );
    if (coinFound != null) {
      _removeFavorites(coin);
    } else {
      _addFavorites(coin);
    }
    return _localDataService.addFavorite(coinsToMap(_favoritesCoins));
  }

  Future<Result<List<Coin>>> getFavorites() async {
    final result = await _localDataService.getFavorites();

    switch (result) {
      case Ok():
        _favoriteStreamController.add(result.value);
        _favoritesCoins.addAll(result.value);
        return Result.ok(result.value);
      case Error():
        log('Erro ao inicializar favoritos', error: result.error);
        _favoriteStreamController.add(const []);
        return Result.error(result.error);
    }
  }

  void _addFavorites(Coin coin) {
    _favoritesCoins.add(coin);
    _favoriteStreamController.add(_favoritesCoins);
  }

  void _removeFavorites(Coin coin) {
    _favoritesCoins.removeWhere(
      (element) => element.id == coin.id,
    );
    _favoriteStreamController.add(_favoritesCoins);
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
          'sparkline_in_7d': coin.sparkLineIn7d.toJson(),
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
}
