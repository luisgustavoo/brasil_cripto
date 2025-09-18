import 'dart:developer';

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

  late final Command1<void, String> toggleFavorite;
  late final Command1<void, String> getFavorites;

  Future<Result<void>> _toggleFavorite(String name) async {
    return Result.ok(null);
  }

  Future<Result<void>> _getFavorites(String vsCurrency) async {
    return Result.ok(null);
  }
}
