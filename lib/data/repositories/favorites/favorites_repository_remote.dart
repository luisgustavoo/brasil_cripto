import 'dart:developer';

import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/sparkline.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoritesRepository)
class FavoritesRepositoryRemote implements FavoritesRepository {
  FavoritesRepositoryRemote({
    required SharedPreferencesService preferencesService,
    required ApiClient apiClient,
  }) : _preferencesService = preferencesService,
       _apiClient = apiClient {
    _init();
  }

  final SharedPreferencesService _preferencesService;
  final ApiClient _apiClient;
  late List<String> _ids = [];

  Future<void> _init() async {
    final result = await _preferencesService.getData();
    switch (result) {
      case Ok():
        _ids = [...?result.value];
      case Error():
        log('Erro ao buscar ids dos favoritos');
    }
  }

  @override
  Future<Result<void>> addFavorite(String id) async {
    _ids.add(id);
    final result = await _preferencesService.setData(_ids);
    switch (result) {
      case Ok():
        log('Id adicionado aos favoritos');
        return const Result.ok(null);
      case Error():
        _ids.remove(id);
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<Coin>>> getFavorites(String vsCurrency) async {
    if (_ids.isEmpty) {
      return const Result.ok(<Coin>[]);
    }
    final ids = _ids.map((e) => e).join(',');
    final result = await _apiClient.fetchCoinsMarkets(vsCurrency, ids: ids);
    switch (result) {
      case Ok():
        final coins = result.value.map(
          (coin) {
            return Coin(
              id: coin.id,
              symbol: coin.symbol,
              name: coin.name,
              image: coin.image,
              currentPrice: coin.currentPrice,
              marketCap: coin.marketCap,
              marketCapRank: coin.marketCapRank,
              totalVolume: coin.totalVolume,
              sparkLineIn7d: Sparkline(price: coin.sparkLineIn7d.price),
              priceChangePercentage1hInCurrency:
                  coin.priceChangePercentage1hInCurrency,
              priceChangePercentage24hInCurrency:
                  coin.priceChangePercentage24hInCurrency,
              priceChangePercentage7dInCurrency:
                  coin.priceChangePercentage7dInCurrency,
              isFavorite: true,
            );
          },
        ).toList();
        return Result.ok(coins);
      case Error():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> removeFavorite(String id) async {
    _ids.remove(id);
    final result = await _preferencesService.setData(_ids);
    switch (result) {
      case Ok():
        log('Id adicionado aos favoritos');
        return const Result.ok(null);
      case Error():
        _ids.add(id);
        return Result.error(result.error);
    }
  }
}
