import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:brasil_cripto/ui/core/ui/coin_title.dart';
import 'package:brasil_cripto/ui/core/ui/coins_market_summary.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      widget.coin.priceChangePercentage7dInCurrency.isNegative
      ? AppColors.darkNegative
      : AppColors.darkPositive;

  // SideTitleWidget _buildBottomTitle(double value, TitleMeta meta) {
  //   final date = _getDateSafe(value.toInt());
  //   return SideTitleWidget(
  //     meta: meta,
  //     child: Transform.rotate(
  //       angle: -45 * 3.1415 / 180,
  //       child: Text(
  //         '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}',
  //         style: TextStyle(
  //           color: _lineColor,
  //           fontSize: 12,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  String _formatarValor(double valor) {
    final locale = Localizations.localeOf(context);
    final symbol = locale.languageCode == 'pt' ? r'R$' : r'US$';
    return NumberFormat.currency(
      locale: locale.languageCode,
      symbol: symbol,
    ).format(valor);
  }

  @override
  Widget build(BuildContext context) {
    const leftReservedSize = 52.0;
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
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: leftReservedSize,
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
                  },
                  touchTooltipData: LineTouchTooltipData(
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
                              text: '\n${_formatarValor(price)}',
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
                    // getTooltipColor: (barSpot) => AppColors.darkBackground,
                  ),
                ),

                lineBarsData: [
                  LineChartBarData(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
