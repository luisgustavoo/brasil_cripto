// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get brazilCripto => 'Brazil Cripto';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get search => 'Bitcoin, Ethereum, etc';

  @override
  String get noCryptocurrencyFound => 'No cryptocurrency found';
}
