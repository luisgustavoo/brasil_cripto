import 'dart:async';

import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';

import '../../models/coin.dart';

class FakeFavoritesRepositoryRemote implements FavoritesRepository {
  final List<String> _ids = [];
  final _controller = StreamController<List<Coin>>();

  @override
  Future<Result<void>> addFavorite(String id) async {
    _ids.add(id);
    _controller.add([kCoin]);
    return const Result.ok(null);
  }

  @override
  Future<Result<List<Coin>>> getFavorites(String vsCurrency) async {
    if (_ids.isEmpty) {
      return const Result.ok(<Coin>[]);
    }
    return const Result.ok([kCoin]);
  }

  @override
  Future<Result<void>> removeFavorite(String id) async {
    _ids.remove(id);
    _controller.add([]);
    return const Result.ok(null);
  }

  @override
  void stopPollingService() {
    _controller.close();
  }

  @override
  Stream<List<Coin>> get favoriteCoins => _controller.stream;
}
