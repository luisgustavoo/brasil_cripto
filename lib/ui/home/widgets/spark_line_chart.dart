import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SparkLineChart extends StatefulWidget {
  const SparkLineChart({super.key});

  @override
  State<SparkLineChart> createState() => _SparkLineChartState();
}

class _SparkLineChartState extends State<SparkLineChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 2,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: Colors.white,
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  color: AppColors.lightPositive,
                  // Espessura do linha
                  barWidth: 1,
                  // Se a linha vai fazer curava
                  isCurved: true,
                  // O angulo da curva da linha default=0.35
                  curveSmoothness: 0.2,
                  // Não deixa transbordar a linha para baixo do gráfico
                  preventCurveOverShooting: true,
                  // Arredonda as bordas no inicio e final da linha
                  isStrokeCapRound: true,
                  // Arredonda as bordas/curva no meio da linha
                  isStrokeJoinRound: true,
                  // Preenche com uma cor o espaço abaixo/dentro da linha
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.lightPositive.withAlpha(100),
                  ),
                  // Preenche com uma cor o espaço acima/fora da linha
                  aboveBarData: BarAreaData(
                    show: true,
                    color: Colors.lightBlueAccent.withAlpha(100),
                  ),
                  // Cria uma lógica para mostra ou não os pontos entre as linhas
                  dotData: FlDotData(
                    // show: false,
                    checkToShowDot: (spot, barData) {
                      return spot.x % 2 == 0;
                    },
                  ),
                  // Desenha os pontos no gráfico
                  spots: const [
                    FlSpot.zero,
                    FlSpot(1, 1),
                    FlSpot(2, 1),
                    FlSpot(3, 1),
                    FlSpot(4, 3),
                    FlSpot(5, 1),
                    FlSpot(6, 7),
                    FlSpot(6.5, 0),
                    FlSpot(7, 1),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
