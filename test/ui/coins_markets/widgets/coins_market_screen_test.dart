import 'package:brasil_cripto/domain/use_cases/favorites/favorite_get_use_case.dart';
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_market_screen.dart';
import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/repositories/fake_coins_markets_repository_remote.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_local.dart';
import '../../../../testing/mocks.dart';

void main() {
  late MockGoRouter goRouter;
  late CoinsMarketViewModel viewModel;
  late FavoriteGetUseCase favoriteGetUseCase;
  late AppLocalizations l10n;

  setUp(() {
    goRouter = MockGoRouter();
    favoriteGetUseCase = FavoriteGetUseCase(
      favoritesRepository: FakeFavoritesRepositoryLocal(),
      coinsMarketsRepository: FakeCoinsMarketsRepositoryRemote(),
    );
    viewModel = CoinsMarketViewModel(
      coinsMarketsRepository: FakeCoinsMarketsRepositoryRemote(),
      favoriteGetUseCase: favoriteGetUseCase,
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

  group('coins market screen ...', () {
    testWidgets('1', (tester) async {
      await loadScreen(tester);
      expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
    testWidgets('2', (tester) async {
      await loadScreen(tester);
      final searchField = find.byKey(const Key(searchEditKey));
      await tester.tap(searchField);
      await tester.pumpAndSettle();
      await tester.enterText(searchField, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('(BTC)'), findsOneWidget);
    });
  });
}
