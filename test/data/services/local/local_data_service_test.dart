import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late LocalDataService localDataService;
  final fakeSharedPreferencesService = FakeSharedPreferencesService();

  setUp(() {
    localDataService = LocalDataService(
      sharedPreferencesService: fakeSharedPreferencesService,
    );
  });

  group('LocalDataService', () {
    test(
      'should add a coin to favorites successfully',
      () async {
        final result = await localDataService.addFavorite(['Bitcoin']);
        expect(result, isA<Ok<void>>());
      },
    );
    test(
      'should add and retrieve favorites',
      () async {
        final addResult = await localDataService.addFavorite(['Bitcoin']);
        expect(addResult, isA<Ok<void>>());
        final result = await localDataService.getFavorites();
        expect(result, isA<Ok<List<String>>>());
        expect(result.asOk.value.first, 'Bitcoin');
      },
    );
  });
}
