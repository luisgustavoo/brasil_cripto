import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:brasil_cripto/ui/favorites/widgets/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_remote.dart';
import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/mocks.dart';

void main() {
  late MockGoRouter goRouter;
  late FakeSharedPreferencesService sharedPreferencesService;
  late FakeApiClient apiClient;
  late FakeFavoritesRepositoryRemote favoritesRepository;
  late FavoriteViewModel viewModel;
  late AppLocalizations l10n;

  setUp(() {
    goRouter = MockGoRouter();
    apiClient = FakeApiClient();
    sharedPreferencesService = FakeSharedPreferencesService();
    favoritesRepository = FakeFavoritesRepositoryRemote(
      apiClient: apiClient,
      preferencesService: sharedPreferencesService,
    );
    viewModel = FavoriteViewModel(
      favoritesRepository: favoritesRepository,
    );
  });

  Future<void> loadScreen(WidgetTester tester) async {
    await testApp(
      tester,
      FavoriteScreen(
        viewModel: viewModel,
      ),
      goRouter: goRouter,
      builder: (appLocalizations) {
        l10n = appLocalizations;
      },
    );
    await tester.pumpAndSettle();
  }

  group('Favorite Screen', () {
    testWidgets('1', (tester) async {
      await loadScreen(tester);
      expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
