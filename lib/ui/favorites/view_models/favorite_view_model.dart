import 'dart:developer';

import 'package:brasil_cripto/data/repositories/favorites/favorites_repository_local.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/use_cases/favorites/favorite_get_use_case.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class FavoriteViewModel extends ChangeNotifier {
  FavoriteViewModel({
    required FavoriteGetUseCase favoriteGetUseCase,
    required FavoritesRepositoryLocal favoritesRepositoryLocal,
  }) : _favoriteGetUseCase = favoriteGetUseCase,
       _favoritesRepositoryLocal = favoritesRepositoryLocal {
    toggleFavorite = Command1(_toggleFavorite);
    getFavorites = Command1(_getFavorites);
  }

  final FavoriteGetUseCase _favoriteGetUseCase;
  final FavoritesRepositoryLocal _favoritesRepositoryLocal;

  late final Command1<void, String> toggleFavorite;
  late final Command1<void, String> getFavorites;

  List<Coin> favoriteCoins = [];

  Future<Result<void>> _toggleFavorite(String name) async {
    final result = await _favoritesRepositoryLocal.toggleFavorite(name);
    switch (result) {
      case Ok():
        log('$name adicionado aos favoritos');
      case Error():
        log('Erro ao adicionar favoritos', error: result.error);
    }
    return result;
  }

  Future<Result<void>> _getFavorites(String vsCurrency) async {
    final result = await _favoriteGetUseCase.getFavorites(vsCurrency);
    switch (result) {
      case Ok():
        favoriteCoins = [...result.value];
        notifyListeners();
      case Error():
        log('Erro ao listar favoritos', error: result.error);
        notifyListeners();
    }
    return result;
  }
}
