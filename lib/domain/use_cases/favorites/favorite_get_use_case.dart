import 'dart:developer';

import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteGetUseCase {
  FavoriteGetUseCase({
    required FavoritesRepository favoritesRepository,
    required CoinsMarketsRepository coinsMarketsRepository,
  }) : _favoritesRepository = favoritesRepository,
       _coinsMarketsRepository = coinsMarketsRepository;

  final FavoritesRepository _favoritesRepository;
  final CoinsMarketsRepository _coinsMarketsRepository;

  Future<Result<List<Coin>>> getFavorites(String vsCurrency) async {
    final favoritesResult = await _favoritesRepository.getFavorites();
    switch (favoritesResult) {
      case Ok():
        if (favoritesResult.value.isEmpty) {
          return const Result.ok([]);
        }
        final coinsMarketResult = await _fetchCoinsMarkets(
          favoritesResult.value,
          vsCurrency,
        );
        switch (coinsMarketResult) {
          case Ok<List<Coin>>():
            return Result.ok(coinsMarketResult.value);
          case Error<List<Coin>>():
            return Result.error(coinsMarketResult.error);
        }
      case Error():
        log(
          'Erro ao listar favoritos',
          error: favoritesResult.error,
        );
        return Result.error(favoritesResult.error);
    }
  }

  Future<Result<List<Coin>>> _fetchCoinsMarkets(
    List<String> namesList,
    String vsCurrency,
  ) async {
    final result = await _coinsMarketsRepository.fetchCoinsMarkets(
      namesList.join(','),
      vsCurrency,
    );
    switch (result) {
      case Ok():
        return Result.ok(result.value);
      case Error():
        return Result.error(result.error);
    }
  }
}
