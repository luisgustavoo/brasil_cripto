import 'dart:developer';

import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/utils/result.dart';

class FavoriteToggleUseCase {
  FavoriteToggleUseCase({
    required FavoritesRepository favoritesRepository,
  }) : _favoritesRepository = favoritesRepository;

  final FavoritesRepository _favoritesRepository;

  Future<Result<void>> toggleFavorite(String name) async {
    final result = await _favoritesRepository.toggleFavorite(name);
    switch (result) {
      case Ok():
        return const Result.ok(null);
      case Error():
        log('Erro ao alterar favorito', error: result.error);
        return Result.error(result.error);
    }
  }
}
