import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:brasil_cripto/ui/core/ui/number_formatter.dart';
import 'package:flutter/material.dart';

class CoinsMarketSummary extends StatefulWidget {
  const CoinsMarketSummary({
    required this.coin,
    super.key,
  });

  final Coin coin;

  @override
  State<CoinsMarketSummary> createState() => _CoinsMarketSummaryState();
}

class _CoinsMarketSummaryState extends State<CoinsMarketSummary> {
  double _currentPrice = 0;
  double _totalVolume = 0;
  double _marketCap = 0;

  @override
  void initState() {
    super.initState();
    _currentPrice = widget.coin.currentPrice;
    _totalVolume = widget.coin.totalVolume;
    _marketCap = widget.coin.marketCap;
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

  Widget _buildPrice(Locale locale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.price,
          style: _titleStyle,
          overflow: TextOverflow.ellipsis,
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: _currentPrice,
            end: widget.coin.currentPrice,
          ),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Text(formatCurrencyValue(value, locale));
          },
        ),
      ],
    );
  }

  Widget _buildVolumeDay(Locale locale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.volumeDay,
          style: _titleStyle,
          overflow: TextOverflow.ellipsis,
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: _totalVolume,
            end: widget.coin.totalVolume,
          ),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Text(formatCurrencyValue(value, locale));
          },
        ),
      ],
    );
  }

  Widget _buildMarketCap(Locale locale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.marketCap,
          style: _titleStyle,
          overflow: TextOverflow.ellipsis,
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: _marketCap,
            end: widget.coin.marketCap,
          ),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            return Text(formatCurrencyValue(value, locale));
          },
        ),
      ],
    );
  }

  Widget _buildOneHour() {
    return Column(
      children: [
        Text(
          context.l10n.oneHour,
          style: _titleStyle,
        ),
        Row(
          children: [
            _iconArrow(
              widget.coin.priceChangePercentage1hInCurrency,
            ),
            _getValue(
              widget.coin.priceChangePercentage1hInCurrency,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOneDay() {
    return Column(
      children: [
        Text(
          context.l10n.oneDay,
          style: _titleStyle,
        ),
        Row(
          children: [
            _iconArrow(
              widget.coin.priceChangePercentage24hInCurrency,
            ),
            _getValue(
              widget.coin.priceChangePercentage24hInCurrency,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSevenDays() {
    return Column(
      children: [
        Text(
          context.l10n.sevenDays,
          style: _titleStyle,
        ),
        Row(
          children: [
            _iconArrow(
              widget.coin.priceChangePercentage7dInCurrency,
            ),
            _getValue(
              widget.coin.priceChangePercentage7dInCurrency,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Column(
      key: Key(widget.coin.id),
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        _buildPrice(locale),
        _buildVolumeDay(locale),
        _buildMarketCap(locale),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOneHour(),
            _buildOneDay(),
            _buildSevenDays(),
          ],
        ),
      ],
    );
  }
}
