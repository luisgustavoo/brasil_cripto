import 'dart:developer';

import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavoriteViewModel extends ChangeNotifier {
  FavoriteViewModel({required FavoritesRepository favoritesRepository})
    : _favoritesRepository = favoritesRepository {
    toggleFavorite = Command1(_toggleFavorite);
    getFavorites = Command0(_getFavorites)..execute();
  }

  final FavoritesRepository _favoritesRepository;

  List<Coin> get favorites => _favoritesRepository.favoritesCoins;

  late final Command1<void, Coin> toggleFavorite;
  late final Command0<void> getFavorites;

  Future<Result<void>> _toggleFavorite(Coin coin) async {
    final result = await _favoritesRepository.toggleFavorite(coin);
    switch (result) {
      case Ok():
        notifyListeners();
      case Error():
        log('Erro ao adicionar favoritos', error: result.error);
        notifyListeners();
    }
    return result;
  }

  Future<Result<void>> _getFavorites() async {
    final result = await _favoritesRepository.getFavorites();
    switch (result) {
      case Ok():
        notifyListeners();
      case Error():
        log('Erro ao listar favoritos', error: result.error);
        notifyListeners();
    }
    return result;
  }
}
