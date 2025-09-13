import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:brasil_cripto/ui/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'mocks.dart';

BuildContext getContext({required WidgetTester tester, required Type screen}) {
  return tester.element(find.byType(screen));
}

Future<void> testApp(
  WidgetTester tester,
  Widget body, {
  GoRouter? goRouter,
}) async {
  // tester.view.devicePixelRatio = 1.0;
  // await tester.binding.setSurfaceSize(const Size(1200, 800));

  await tester.pumpWidget(
    MaterialApp(
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,

      home: InheritedGoRouter(
        goRouter: goRouter ?? MockGoRouter(),
        child: Scaffold(body: body),
      ),
    ),
  );
}
