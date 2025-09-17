import 'dart:developer';

import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository_local.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteGetUseCase {
  FavoriteGetUseCase({
    required FavoritesRepositoryLocal favoritesRepositoryLocal,
    required CoinsMarketsRepository coinsMarketsRepositoryRemote,
  }) : _favoritesRepositoryLocal = favoritesRepositoryLocal,
       _coinsMarketsRepositoryRemote = coinsMarketsRepositoryRemote;

  final FavoritesRepositoryLocal _favoritesRepositoryLocal;
  final CoinsMarketsRepository _coinsMarketsRepositoryRemote;

  Future<Result<List<Coin>>> getFavorites(String vsCurrency) async {
    final favoritesResult = await _favoritesRepositoryLocal.getFavorites();
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
    final result = await _coinsMarketsRepositoryRemote.fetchCoinsMarkets(
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
