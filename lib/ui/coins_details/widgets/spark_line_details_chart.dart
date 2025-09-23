import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:brasil_cripto/ui/core/ui/coin_title.dart';
import 'package:brasil_cripto/ui/core/ui/coins_market_summary.dart';
import 'package:brasil_cripto/ui/core/ui/number_formatter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SparkLineDetailsChart extends StatefulWidget {
  const SparkLineDetailsChart({
    required this.coin,
    required this.market,
    super.key,
  });

  final Coin coin;
  final Market market;

  @override
  State<SparkLineDetailsChart> createState() => _SparkLineDetailsChartState();
}

class _SparkLineDetailsChartState extends State<SparkLineDetailsChart> {
  late final List<(DateTime, double)> _priceHistory = widget.market.prices
      .map(
        (item) =>
            (DateTime.fromMillisecondsSinceEpoch(item[0].toInt()), item[1]),
      )
      .toList();

  Color get _lineColor =>
      widget.coin.priceChangePercentage24hInCurrency.isNegative
      ? AppColors.darkNegative
      : AppColors.darkPositive;

  FlTitlesData _buildTitles() {
    return FlTitlesData(
      rightTitles: const AxisTitles(),
      topTitles: const AxisTitles(),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 52,
          maxIncluded: false,
          minIncluded: false,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 38,
          maxIncluded: false,
          getTitlesWidget: (value, meta) {
            final date = _priceHistory[value.toInt()].$1;
            return SideTitleWidget(
              meta: meta,
              child: Transform.rotate(
                angle: -45 * 3.14 / 180,
                child: Text(
                  '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: _lineColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  LineTouchData _lineTouchData() {
    return LineTouchData(
      touchSpotThreshold: 5,
      getTouchLineStart: (_, __) => -double.infinity,
      getTouchLineEnd: (_, __) => double.infinity,
      getTouchedSpotIndicator: _getTouchedSpotIndicator,
      touchTooltipData: _touchTooltipData(),
    );
  }

  LineTouchTooltipData _touchTooltipData() {
    final locale = Localizations.localeOf(context);
    return LineTouchTooltipData(
      getTooltipItems: (touchedBarSpots) {
        return touchedBarSpots.map((barSpot) {
          final price = barSpot.y;
          final date = _priceHistory[barSpot.x.toInt()].$1;
          return LineTooltipItem(
            '',
            const TextStyle(
              color: AppColors.darkBackground,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text:
                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
                style: TextStyle(
                  color: _lineColor,
                  // AppColors.contentColorGreen.darken(20),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: '\n${formatCurrencyValue(price, locale)}',
                style: TextStyle(
                  color: _lineColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          );
        }).toList();
      },
    );
  }

  List<TouchedSpotIndicatorData> _getTouchedSpotIndicator(
    LineChartBarData barData,
    List<int> spotIndexes,
  ) {
    return spotIndexes.map((spotIndex) {
      return TouchedSpotIndicatorData(
        FlLine(
          color: _lineColor,
          strokeWidth: 1.5,
          dashArray: [8, 2],
        ),
        FlDotData(
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 6,
              color: _lineColor,
              strokeColor: _lineColor,
            );
          },
        ),
      );
    }).toList();
  }

  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      shadow: Shadow(
        color: _lineColor,
        blurRadius: 2,
      ),
      color: _lineColor,
      barWidth: 1,
      belowBarData: BarAreaData(
        show: true,
        color: _lineColor.withAlpha(100),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _lineColor.withValues(alpha: 0.2),
            _lineColor.withValues(alpha: 0),
          ],
          stops: const [0.5, 1.0],
        ),
      ),
      dotData: const FlDotData(
        show: false,
      ),
      spots: _priceHistory.asMap().entries.map((e) {
        final index = e.key;
        final item = e.value;
        final value = item.$2;
        return FlSpot(index.toDouble(), value);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CoinTitle(coin: widget.coin),
        CoinsMarketSummary(
          coin: widget.coin,
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: LineChart(
              duration: const Duration(milliseconds: 250),
              LineChartData(
                titlesData: _buildTitles(),
                borderData: FlBorderData(
                  show: false,
                ),
                gridData: const FlGridData(
                  show: false,
                ),
                lineTouchData: _lineTouchData(),
                lineBarsData: [
                  _buildLineChartBarData(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
