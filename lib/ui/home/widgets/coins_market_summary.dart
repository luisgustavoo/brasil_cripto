import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinsMarketSummary extends StatelessWidget {
  const CoinsMarketSummary({
    required this.coinsMarkets,
    required this.locale,
    super.key,
  });

  final CoinsMarkets coinsMarkets;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.price,
              style: _titleStyle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(_formatarValor(coinsMarkets.currentPrice)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.volumeDay,
              style: _titleStyle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(_formatarValor(coinsMarkets.totalVolume)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.marketCap,
              style: _titleStyle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(_formatarValor(coinsMarkets.totalVolume)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  context.l10n.oneHour,
                  style: _titleStyle,
                ),
                Row(
                  children: [
                    _iconArrow(coinsMarkets.priceChangePercentage1hInCurrency),
                    _getValue(coinsMarkets.priceChangePercentage1hInCurrency),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  context.l10n.oneDay,
                  style: _titleStyle,
                ),
                Row(
                  children: [
                    _iconArrow(coinsMarkets.priceChangePercentage24hInCurrency),
                    _getValue(coinsMarkets.priceChangePercentage24hInCurrency),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  context.l10n.sevenDays,
                  style: _titleStyle,
                ),
                Row(
                  children: [
                    _iconArrow(coinsMarkets.priceChangePercentage7dInCurrency),
                    _getValue(coinsMarkets.priceChangePercentage7dInCurrency),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String _formatarValor(double valor) {
    final symbol = locale.languageCode == 'pt' ? r'R$' : r'US$';
    return NumberFormat.currency(
      locale: locale.languageCode,
      symbol: symbol,
    ).format(valor);
  }

  TextStyle get _titleStyle {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
  }

  Icon _iconArrow(double value) {
    if (value.isNegative) {
      return const Icon(
        Icons.arrow_drop_down_rounded,
        color: AppColors.darkNegative,
      );
    }

    return const Icon(
      Icons.arrow_drop_up_rounded,
      color: AppColors.darkPositive,
    );
  }

  Text _getValue(double value) {
    return Text(
      '${value.toStringAsFixed(1)}%',
      style: TextStyle(
        color: value.isNegative
            ? AppColors.darkNegative
            : AppColors.darkPositive,
      ),
    );
  }
}
