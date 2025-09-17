import 'dart:async';
import 'dart:developer';

import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoritesRepository)
class FavoritesRepositoryLocal implements FavoritesRepository {
  FavoritesRepositoryLocal({
    required LocalDataService localDataService,
  }) : _localDataService = localDataService;

  final LocalDataService _localDataService;
  late List<String> _names;

  @override
  Future<Result<void>> toggleFavorite(String name) async {
    final result = await getFavorites();
    switch (result) {
      case Ok():
        _names = [...result.value];
        if (_containsName(name)) {
          await _removeFavorites(name);
        } else {
          await _addFavorites(name);
        }
        return const Result.ok(null);
      case Error():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<String>>> getFavorites() async {
    final result = await _localDataService.getFavorites();
    switch (result) {
      case Ok():
        return Result.ok(result.value);
      case Error():
        log('Erro ao inicializar favoritos', error: result.error);
        return Result.error(result.error);
    }
  }

  Future<void> _addFavorites(String name) async {
    _names.add(name);
    final result = await _localDataService.addFavorite(_names);
    switch (result) {
      case Ok():
        log('Adicionado aos favoritos! $name');
      case Error():
        _names.removeWhere(
          (element) => element.toLowerCase() == name.toLowerCase(),
        );
    }
  }

  Future<void> _removeFavorites(String name) async {
    _names.removeWhere(
      (element) => element.toLowerCase() == name.toLowerCase(),
    );
    final result = await _localDataService.addFavorite(_names);
    switch (result) {
      case Ok():
        log('Removido dos favoritos! $name');
      case Error():
        _names.add(name);
    }
  }

  bool _containsName(String name) => _names.any(
    (e) => e.toLowerCase() == name.toLowerCase(),
  );
}
