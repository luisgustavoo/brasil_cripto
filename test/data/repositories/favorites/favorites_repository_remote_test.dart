import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository_remote.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late FavoritesRepository favoritesRepository;

  setUp(() {
    favoritesRepository = FavoritesRepositoryRemote(
      preferencesService: FakeSharedPreferencesService(),
      apiClient: FakeApiClient(),
    );
  });

  group('FavoritesRepository', () {
    test('should emit updated favorites when a coin is added', () async {
      final result = await favoritesRepository.addFavorite('bitcoin');
      expect(result, isA<Ok<void>>());
    });
    test('should add a coin to favorites and return it on retrieval', () async {
      final toggleResult = await favoritesRepository.addFavorite('bitcoin');
      expect(toggleResult, isA<Ok<void>>());
      final result = await favoritesRepository.getFavorites('usd');
      expect(result, isA<Ok<List<Coin>>>());
      expect(result.asOk.value.first.name, 'Bitcoin');
    });
    test(
      'should remove a coin from favorites when it was previously added',
      () async {
        final addResult = await favoritesRepository.addFavorite('bitcoin');
        expect(addResult, isA<Ok<void>>());
        final result = await favoritesRepository.removeFavorite('bitcoin');
        expect(result, isA<Ok<void>>());
        final getResult = await favoritesRepository.getFavorites('usd');
        expect(getResult.asOk.value, isEmpty);
      },
    );
  });
}
