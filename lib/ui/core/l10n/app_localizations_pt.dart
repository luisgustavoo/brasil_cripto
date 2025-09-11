// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get brazilCripto => 'Brasil Cripto';

  @override
  String get errorLoadingData => 'Erro ao carregar dados';

  @override
  String get search => 'Bitcoin, Ethereum, etc';

  @override
  String get noCryptocurrencyFound => 'Nenhuma criptomoeda encontrada';

  @override
  String get price => 'Preço';

  @override
  String get oneHour => '1h';

  @override
  String get oneDay => '24h';

  @override
  String get sevenDays => '7d';

  @override
  String get volumeDay => 'Volume 24h';

  @override
  String get marketCap => 'Valor de mercado';
}
