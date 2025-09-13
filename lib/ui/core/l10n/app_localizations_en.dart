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

  @override
  String get price => 'Price';

  @override
  String get oneHour => '1h';

  @override
  String get oneDay => '24h';

  @override
  String get sevenDays => '7d';

  @override
  String get volumeDay => '24h Volume';

  @override
  String get marketCap => 'Market Cap';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get confirmRemoveTitle => 'Remove from favorites';

  @override
  String get confirmRemovePrefix => 'Are you sure you want to remove';

  @override
  String get remove => 'Remove';

  @override
  String get cancel => 'Cancel';

  @override
  String confirmRemoveMessage(Object coinName) {
    return 'Are you sure you want to remove $coinName from your favorites?';
  }
}
