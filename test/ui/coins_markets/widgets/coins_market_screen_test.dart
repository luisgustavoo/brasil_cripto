import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_market_screen.dart';
import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/repositories/fake_coins_markets_repository_remote.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_remote.dart';
import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/mocks.dart';

void main() {
  late MockGoRouter goRouter;
  late CoinsMarketViewModel viewModel;
  late FakeSharedPreferencesService sharedPreferencesService;
  late FakeApiClient apiClient;
  late FakeFavoritesRepositoryRemote favoritesRepository;
  late AppLocalizations l10n;

  setUp(() {
    goRouter = MockGoRouter();
    apiClient = FakeApiClient();
    sharedPreferencesService = FakeSharedPreferencesService();
    favoritesRepository = FakeFavoritesRepositoryRemote(
      apiClient: apiClient,
      preferencesService: sharedPreferencesService,
    );
    viewModel = CoinsMarketViewModel(
      coinsMarketsRepository: FakeCoinsMarketsRepositoryRemote(),
      favoritesRepository: favoritesRepository,
    );
  });

  Future<void> loadScreen(WidgetTester tester) async {
    await testApp(
      tester,
      CoinsMarketScreen(
        viewModel: viewModel,
      ),
      goRouter: goRouter,
      builder: (appLocalizations) {
        l10n = appLocalizations;
      },
    );
    await tester.pumpAndSettle();
  }

  Future<void> search(WidgetTester tester) async {
    await loadScreen(tester);
    final searchField = find.byKey(const Key(searchEditKey));
    await tester.tap(searchField);
    await tester.pumpAndSettle();
    await tester.enterText(searchField, 'Bitcoin');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  }

  group('Coins Market Screen', () {
    testWidgets(
      'should display no cryptocurrency message and search field initially',
      (tester) async {
        await loadScreen(tester);
        expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
      },
    );
    testWidgets('should display Bitcoin ticker when searched', (tester) async {
      await search(tester);
      expect(find.text('(BTC)'), findsOneWidget);
    });
    testWidgets(
      'should navigate to details screen when tapping on Bitcoin card',
      (tester) async {
        when(
          () => goRouter.push(any<String>(), extra: any(named: 'extra')),
        ).thenAnswer((_) async => null);
        await search(tester);
        final card = find.widgetWithText(Card, 'Bitcoin');
        expect(card, findsOneWidget);
        await tester.tap(card);
        await tester.pump();
        verify(
          () => goRouter.push(any<String>(), extra: any(named: 'extra')),
        ).called(1);
      },
    );
  });
}
