import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/home_coins_market_tab.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/repositories/fake_coins_markets_repository_remote.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_remote.dart';
import '../../../../testing/mocks.dart';

void main() {
  late MockGoRouter goRouter;
  late HomeViewModel viewModel;
  late AppLocalizations l10n;

  setUp(() {
    goRouter = MockGoRouter();
    viewModel = HomeViewModel(
      coinsMarketsRepository: FakeCoinsMarketsRepositoryRemote(),
      favoritesRepository: FakeFavoritesRepositoryRemote(),
    );
  });

  Future<void> loadScreen(WidgetTester tester) async {
    await testApp(
      tester,
      HomeScreen(
        viewModel: viewModel,
      ),
      goRouter: goRouter,
      builder: (appLocalizations) {
        l10n = appLocalizations;
      },
    );
    await tester.pumpAndSettle();
  }

  group('Home Screen', () {
    testWidgets('should display title and empty state', (tester) async {
      await loadScreen(tester);
      expect(find.text(l10n.brazilCripto), findsOneWidget);
      expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
    });
    // testWidgets(
    //   'should navigate to coin details after search',
    //   (tester) async {
    //     when(
    //       () => goRouter.push(any<String>(), extra: any(named: 'extra')),
    //     ).thenAnswer((_) async => null);
    //     await loadScreen(tester);
    //     final marketTab = find.byKey(const Key(marketTabKey));
    //     await tester.tap(marketTab);
    //     await tester.pumpAndSettle();
    //     final searchField = find.byKey(const Key(searchEditKey));
    //     await tester.tap(searchField);
    //     await tester.pumpAndSettle();
    //     await tester.showKeyboard(searchField);
    //     await tester.enterText(searchField, 'Bitcoin');
    //     await tester.pumpAndSettle();
    //     await tester.testTextInput.receiveAction(TextInputAction.done);
    //     await tester.pump();
    //     expect(find.text('(BTC)'), findsOneWidget);
    //     final bitcoinCard = find.byType(CoinsCard);
    //     expect(bitcoinCard, findsOneWidget);
    //     await tester.tap(bitcoinCard);
    //     await tester.pump();
    //     verify(
    //       () => goRouter.push(any<String>(), extra: any(named: 'extra')),
    //     ).called(1);
    //   },
    // );

    // testWidgets(
    //   'should search for Bitcoin and favorite it',
    //   (tester) async {
    //     await loadScreen(tester);
    //     final marketTab = find.byKey(const Key(marketTabKey));
    //     await tester.tap(marketTab);
    //     await tester.pumpAndSettle();
    //     final searchField = find.byKey(const Key(searchEditKey));
    //     await tester.tap(searchField);
    //     await tester.pumpAndSettle();
    //     await tester.showKeyboard(searchField);
    //     await tester.enterText(searchField, 'Bitcoin');
    //     await tester.pumpAndSettle();
    //     await tester.testTextInput.receiveAction(TextInputAction.done);
    //     await tester.pump();
    //     expect(find.text('(BTC)'), findsOneWidget);
    //     final starBorderIcon = find.byIcon(Icons.star_border).at(0);
    //     await tester.tap(starBorderIcon);
    //     await tester.pump();
    //     final favoriteTab = find.byKey(const Key(favoriteTabKey));
    //     await tester.tap(favoriteTab);
    //     await tester.pumpAndSettle();
    //     final starIcon = find.byIcon(Icons.star).at(0);
    //     expect(starIcon, findsOneWidget);
    //   },
    // );
    // testWidgets(
    //   'remove favorite',
    //   (tester) async {
    //     await loadScreen(tester);
    //     final starIcon = find.descendant(
    //       of: find.byKey(const Key('favorite-icon-bitcoin')),
    //       matching: find.byIcon(Icons.star),
    //     );
    //     expect(starIcon, findsOneWidget);
    //     await tester.tap(starIcon);
    //     await tester.pumpAndSettle();
    //     expect(find.text(l10n.confirmRemoveTitle), findsOneWidget);
    //     final removeButton = find.text(l10n.remove);
    //     await tester.tap(removeButton);
    //     await tester.pumpAndSettle();
    //     expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
    //   },
    // );
  });
}
