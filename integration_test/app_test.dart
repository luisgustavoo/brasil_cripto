import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../testing/app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> loadHomeScreen(WidgetTester tester) async {
    await testApp(
      tester,
      const HomeScreen(),
    );
    await tester.pumpAndSettle();
  }

  group('HomeScreen / CoinsMarketScreen tests', () {
    testWidgets('should display title and empty state', (tester) async {
      final context = getContext(tester: tester, screen: HomeScreen);
      final l10n = context.l10n;
      await loadHomeScreen(tester);
      expect(find.text(l10n.brazilCripto), findsOneWidget);
      expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
    });

    testWidgets('should navigate to market tab and show search field', (
      tester,
    ) async {
      await loadHomeScreen(tester);
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('search-edit')), findsOneWidget);
    });

    testWidgets('should search for a coin and display result', (tester) async {
      await loadHomeScreen(tester);
      final marketTabButton = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButton);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key('search-edit'));
      await tester.tap(searchField);
      await tester.pumpAndSettle();
      await tester.enterText(searchField, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.widgetWithText(Card, 'Bitcoin'), findsOneWidget);
    });

    testWidgets('should search for Bitcoin and favorite it', (tester) async {
      await loadHomeScreen(tester);
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key('search-edit'));
      await tester.tap(searchField);
      await tester.pumpAndSettle();
      await tester.enterText(searchField, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(milliseconds: 100));
      final bitcoinCard = find.widgetWithText(Card, 'Bitcoin');
      final starIcon = find.descendant(
        of: bitcoinCard,
        matching: find.byIcon(Icons.star_border),
      );
      await tester.tap(starIcon);
      await tester.pump(const Duration(milliseconds: 100));
      expect(
        find.descendant(of: bitcoinCard, matching: find.byIcon(Icons.star)),
        findsOneWidget,
      );
      final marketTabButton = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButton);
      await tester.pump();
      expect(find.widgetWithText(Card, 'Bitcoin'), findsOneWidget);
    });
    testWidgets('should navigate to coin details when tapping on a coin card', (
      tester,
    ) async {
      await loadHomeScreen(tester);
      await tester.pump();
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key('search-edit'));
      await tester.tap(searchField);
      await tester.pump();
      await tester.enterText(searchField, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(milliseconds: 100));
      final bitcoinCard = find.widgetWithText(Card, 'Bitcoin');
      expect(bitcoinCard, findsOneWidget);
      await tester.tap(bitcoinCard);
      await tester.pump();
    });
  });
}
