import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String formatCurrencyValue(
  double valor,
  Locale locale,
) {
  final symbol = locale.languageCode == 'pt' ? r'R$' : r'US$';
  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: symbol,
  );
  return formatter.format(valor);
}
