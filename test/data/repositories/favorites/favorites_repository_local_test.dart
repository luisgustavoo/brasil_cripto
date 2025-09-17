import 'package:brasil_cripto/data/repositories/favorites/favorites_repository_local.dart';
import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late FavoritesRepositoryLocal favoritesRepositoryLocal;

  setUp(() {
    favoritesRepositoryLocal = FavoritesRepositoryLocal(
      localDataService: LocalDataService(
        sharedPreferencesService: FakeSharedPreferencesService(),
      ),
    );
  });

  group('FavoritesRepository', () {
    test('should emit updated favorites when a coin is toggled', () async {
      final result = await favoritesRepositoryLocal.toggleFavorite('Bitcoin');
      expect(result, isA<Ok<void>>());
    });
    test('should add coin to favorites and retrieve it', () async {
      final toggleResult = await favoritesRepositoryLocal.toggleFavorite(
        'Bitcoin',
      );
      expect(toggleResult, isA<Ok<void>>());
      final result = await favoritesRepositoryLocal.getFavorites();
      expect(result, isA<Ok<List<String>>>());
      expect(result.asOk.value.first, 'Bitcoin');
    });
  });
}
