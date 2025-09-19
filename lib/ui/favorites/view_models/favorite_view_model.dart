import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/command.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavoriteViewModel extends ChangeNotifier {
  FavoriteViewModel({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository = favoritesRepository {
    toggleFavorite = Command1(_toggleFavorite);
    getFavorites = Command1(_getFavorites);
  }

  final FavoritesRepository _favoritesRepository;
  late final Command1<void, Coin> toggleFavorite;
  late final Command1<void, String> getFavorites;
  List<Coin> coins = [];

  Future<Result<void>> _toggleFavorite(Coin coin) async {
    try {
      if (coin.isFavorite) {
        return _removeFavorite(coin.id);
      }
      return _addFavorite(coin.id);
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _getFavorites(String vsCurrency) async {
    try {
      final result = await _favoritesRepository.getFavorites(vsCurrency);
      switch (result) {
        case Ok():
          coins = [...result.value];
          return const Result.ok(null);
        case Error():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _addFavorite(String id) async {
    return _favoritesRepository.addFavorite(id);
  }

  Future<Result<void>> _removeFavorite(String id) async {
    return _favoritesRepository.removeFavorite(id);
  }
}
