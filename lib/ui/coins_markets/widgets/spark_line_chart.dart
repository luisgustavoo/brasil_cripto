import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SparkLineChart extends StatefulWidget {
  const SparkLineChart({
    required this.coin,
    super.key,
  });

  final Coin coin;

  @override
  State<SparkLineChart> createState() => _SparkLineChartState();
}

class _SparkLineChartState extends State<SparkLineChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          gridData: const FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              color: widget.coin.priceChangePercentage7dInCurrency.isNegative
                  ? AppColors.darkNegative
                  : AppColors.darkPositive,
              barWidth: 1,
              curveSmoothness: 0.2,
              preventCurveOverShooting: true,
              isStrokeCapRound: true,
              isStrokeJoinRound: true,
              dotData: const FlDotData(show: false),
              spots: widget.coin.sparkLineIn7d.price
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
