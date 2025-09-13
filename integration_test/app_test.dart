import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/routing/router.dart';
import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/theme.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_market_screen.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  late AppLocalizations l10n;

  Future<void> clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  setUpAll(clearPrefs);

  Future<void> loadHomeScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: Router.router,
        locale: const Locale('pt', 'BR'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.lightTheme,
        builder: (context, child) {
          l10n = context.l10n;
          return child!;
        },
      ),
    );
    await tester.pumpAndSettle();
  }

  group('end-to-end test', () {
    testWidgets('should display title and empty state', (tester) async {
      await loadHomeScreen(tester);
      expect(find.text(l10n.brazilCripto), findsOneWidget);
      expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
    });
    testWidgets(
      'should search for a coin and display result',
      (tester) async {
        await loadHomeScreen(tester);
        final marketTab = find.byKey(const Key(marketTabKey));
        await tester.tap(marketTab);
        await tester.pumpAndSettle();
        final searchField = find.byKey(const Key(searchEditKey));
        await tester.tap(searchField);
        await tester.pumpAndSettle();
        await tester.showKeyboard(searchField);
        await tester.enterText(searchField, 'Bitcoin');
        await tester.pumpAndSettle();
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        expect(find.text('(BTC)'), findsOneWidget);
      },
    );

    // testWidgets(
    //   'should search for Bitcoin and favorite it',
    //   (tester) async {
    //     // Pesquisa o item
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
    //     await tester.pumpAndSettle();
    //     expect(find.text('(BTC)'), findsOneWidget);
    //     // Favorita o item
    //     final starBorderIcon = find.byIcon(Icons.star_border).at(0);
    //     await tester.tap(starBorderIcon);
    //     await tester.pumpAndSettle();
    //     final favoriteTab = find.byKey(const Key(favoriteTabKey));
    //     await tester.tap(favoriteTab);
    //     await tester.pumpAndSettle();
    //     final starIcon = find.byIcon(Icons.star).at(0);
    //     expect(starIcon, findsOneWidget);
    //   },
    // );
    // testWidgets(
    //   '4',
    //   (tester) async {
    //     await loadHomeScreen(tester);
    //     final marketTabButton = find.byKey(const Key('market-tab-button'));
    //     await tester.tap(marketTabButton);
    //     await tester.pumpAndSettle();
    //     final searchField = find.byKey(const Key('search-edit'));
    //     await tester.tap(searchField);
    //     await tester.pumpAndSettle();
    //     await tester.enterText(searchField, 'Bitcoin');
    //     await tester.testTextInput.receiveAction(TextInputAction.done);
    //     await tester.pump(const Duration(milliseconds: 100));
    //     final starIcon = find.byIcon(Icons.star_border).at(0);
    //     await tester.tap(starIcon);
    //     await tester.pump(const Duration(milliseconds: 100));
    //     expect(find.byIcon(Icons.star).at(0), findsOneWidget);
    //     final favoriteTabButton = find.byKey(const Key('favorite-tab-button'));
    //     await tester.tap(favoriteTabButton);
    //     await tester.pump();
    //     expect(find.text('(BTC)'), findsOneWidget);

    //     await tester.tap(find.byIcon(Icons.star).at(0));
    //     await tester.pumpAndSettle();
    //     expect(find.text(l10n.confirmRemoveTitle), findsOneWidget);
    //     await tester.tap(find.text(l10n.remove));
    //     await tester.pumpAndSettle();
    //     expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
    //   },
    // // );
    // testWidgets(
    //   'should navigate to coin details when tapping on a coin card',
    //   (
    //     tester,
    //   ) async {
    //     await loadHomeScreen(tester);
    //     final marketTabButton = find.byKey(const Key('market-tab-button'));
    //     await tester.tap(marketTabButton);
    //     await tester.pumpAndSettle();
    //     final searchField = find.byKey(const Key('search-edit'));
    //     await tester.tap(searchField);
    //     await tester.pump();
    //     await tester.enterText(searchField, 'Bitcoin');
    //     await tester.testTextInput.receiveAction(TextInputAction.done);
    //     await tester.pumpAndSettle();
    //     final bitcoinCard = find.byType(CoinsCard);
    //     expect(bitcoinCard, findsOneWidget);
    //     await tester.tap(bitcoinCard);
    //     await tester.pumpAndSettle();
    //   },
    // );
  });
}
