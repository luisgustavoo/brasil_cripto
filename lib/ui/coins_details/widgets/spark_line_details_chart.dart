import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SparkLineDetailsChart extends StatelessWidget {
  const SparkLineDetailsChart({required this.coin, super.key});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(
            show: false,
            // bottomTitles: AxisTitles(axisNameWidget: Text('teste')),
          ),
          borderData: FlBorderData(
            show: false,
            // border: Border.all(
            //   color: Colors.white,
            // ),
          ),
          // Não mostra as informações ao clicar na linha
          lineTouchData: const LineTouchData(enabled: false),
          gridData: const FlGridData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              color: coin.priceChangePercentage7dInCurrency.isNegative
                  ? AppColors.darkNegative
                  : AppColors.lightPositive,
              // Espessura do linha
              barWidth: 1,
              // Se a linha vai fazer curava
              // isCurved: true,
              // O angulo da curva da linha default=0.35
              curveSmoothness: 0.2,
              // Não deixa transbordar a linha para baixo do gráfico
              preventCurveOverShooting: true,
              // Arredonda as bordas no inicio e final da linha
              isStrokeCapRound: true,
              // Arredonda as bordas/curva no meio da linha
              isStrokeJoinRound: true,
              // Preenche com uma cor o espaço abaixo/dentro da linha
              // belowBarData: BarAreaData(
              //   show: true,
              //   color: AppColors.lightPositive.withAlpha(100),
              // ),
              // Preenche com uma cor o espaço acima/fora da linha
              // aboveBarData: BarAreaData(
              //   show: true,
              //   color: Colors.lightBlueAccent.withAlpha(100),
              // ),
              // Cria uma lógica para mostra ou não os pontos entre as linhas
              dotData: const FlDotData(
                show: false,
                // checkToShowDot: (spot, barData) {
                //   return false;
                //   // return spot.x % 2 == 0;
                // },
                // // Altera o desenho do ponto. Ex: bolinha(FlDotCirclePainter),X(FlDotCrossPainter) ou quadrado(FlDotSquarePainter)
                // getDotPainter:
                //     (
                //       spot,
                //       xPercentage,
                //       bar,
                //       index, {
                //       size,
                //     }) {
                //       return FlDotSquarePainter(
                //         size: 20,
                //         color: AppColors.darkNegative,
                //       );
                //     },
              ),
              // Mostra o indicador na linha, baseado no index fornecido
              // showingIndicators: [1, 2],
              // Desenha a linha tracejada(com pontinhos)
              // dashArray: [1, 8],
              // Desenha os pontos no gráfico
              spots: coin.sparkLineIn7d.price
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
              // spots: const [
              //   FlSpot.zero,
              //   FlSpot(1, 1),
              //   FlSpot(2, 5),
              //   FlSpot(3, 1),
              //   FlSpot(4, 3),
              //   FlSpot(5, 1),
              //   FlSpot(6, 7),
              //   FlSpot(6.5, 0),
              //   FlSpot(7, 1),
              // ],
            ),
          ],
        ),
      ),
    );
  }
}
