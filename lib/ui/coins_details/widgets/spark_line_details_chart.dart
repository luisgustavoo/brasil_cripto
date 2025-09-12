import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SparkLineDetailsChart extends StatefulWidget {
  const SparkLineDetailsChart({
    required this.coin,
    required this.market,
    required this.locale,
    super.key,
  });

  final Coin coin;
  final Market market;
  final Locale locale;

  @override
  State<SparkLineDetailsChart> createState() => _SparkLineDetailsChartState();
}

class _SparkLineDetailsChartState extends State<SparkLineDetailsChart> {
  List<(DateTime, double)>? _priceHistory;

  Future<void> _reloadData() async {
    setState(() {
      _priceHistory = widget.market.prices.map((item) {
        final timestamp = item[0].toInt();
        final price = item[1];
        return (DateTime.fromMillisecondsSinceEpoch(timestamp), price);
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.coin.priceChangePercentage7dInCurrency.isNegative
        ? AppColors.darkNegative
        : AppColors.lightPositive;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),

          gridData: const FlGridData(
            show: false,
          ),

          lineTouchData: LineTouchData(
            touchSpotThreshold: 5,
            getTouchLineStart: (_, __) => -double.infinity,
            getTouchLineEnd: (_, __) => double.infinity,
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((spotIndex) {
                return TouchedSpotIndicatorData(
                  const FlLine(
                    color: AppColors.darkNegative,
                    strokeWidth: 1.5,
                    dashArray: [8, 2],
                  ),
                  FlDotData(
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: color,

                        strokeColor: color,
                      );
                    },
                  ),
                );
              }).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedBarSpots) {
                return touchedBarSpots.map((barSpot) {
                  final price = barSpot.y;
                  final date = _priceHistory![barSpot.x.toInt()].$1;
                  return LineTooltipItem(
                    '',
                    const TextStyle(
                      color: AppColors.darkBackground,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '${date.day}/${date.month}/${date.year}',
                        style: TextStyle(
                          color: color,
                          // AppColors.contentColorGreen.darken(20),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: '\n${_formatarValor(price)}',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
              // getTooltipColor: (barSpot) => AppColors.darkBackground,
            ),
          ),

          lineBarsData: [
            LineChartBarData(
              shadow: Shadow(
                color: color,
                blurRadius: 2,
              ),
              color: color,
              barWidth: 1,
              belowBarData: BarAreaData(
                show: true,
                color: color.withAlpha(100),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color.withValues(alpha: 0.2),
                    color.withValues(alpha: 0),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
              dotData: const FlDotData(
                show: false,
              ),
              spots:
                  _priceHistory?.asMap().entries.map((e) {
                    final index = e.key;
                    final item = e.value;
                    final value = item.$2;
                    return FlSpot(index.toDouble(), value);
                  }).toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }

  String _formatarValor(double valor) {
    final symbol = widget.locale.languageCode == 'pt' ? r'R$' : r'US$';
    return NumberFormat.currency(
      locale: widget.locale.languageCode,
      symbol: symbol,
    ).format(valor);
  }
}
