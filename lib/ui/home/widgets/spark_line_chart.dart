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
              titlesData: FlTitlesData(
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
              // lineTouchData: const LineTouchData(enabled: false),
              gridData: FlGridData(
                show: false,
              ),
              lineBarsData: [
                LineChartBarData(
                  color: AppColors.lightPositive,
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
                  dotData: FlDotData(
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
                  spots: prices
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
        ),
      ),
    );
  }

  List<double> get prices {
    return [
      111751.64761020488,
      112072.79984901128,
      111853.88232508626,
      111492.64500777487,
      111177.66463784108,
      111127.46726016133,
      110686.91790192894,
      110409.54924363771,
      110505.55001973202,
      110705.26361377492,
      110805.39711272641,
      110646.5304182009,
      110846.35249628387,
      110785.36909714933,
      110448.69917910869,
      109969.81043799862,
      109624.55017607489,
      109497.72346906656,
      109803.09786995356,
      110023.3144941601,
      109873.8930916779,
      110403.23903480718,
      110542.44225608995,
      111490.51479289168,
      110752.04142516552,
      110546.35219584999,
      111123.18893239835,
      111365.16616946645,
      111320.95589222391,
      111443.83629951079,
      111562.752756278,
      111900.94104148331,
      112964.68755449636,
      112620.51184991721,
      112258.88398574904,
      112259.72880567885,
      112361.22450543038,
      113225.00021261438,
      113034.03215529391,
      110514.16200241748,
      110663.4511588435,
      110781.59184322049,
      110611.41463627842,
      111192.72160309477,
      111445.2502071209,
      111619.38620235208,
      110624.30953942804,
      110813.80860700153,
      110656.308978032,
      110782.9680650024,
      110873.87504986444,
      111103.49983851465,
      111070.9293275909,
      110856.40824808505,
      110725.91196503112,
      110772.86794074306,
      110817.2532145556,
      110948.47286442367,
      110697.41836548288,
      110766.63559733458,
      110770.07248515126,
      110833.08962160254,
      110944.93163333445,
      110832.31716394494,
      110417.35028698956,
      110256.24911657201,
      110175.86574226645,
      110265.97583337485,
      110054.77331373848,
      110174.33371417443,
      110235.30370196157,
      110175.25026599839,
      110223.83395870344,
      110367.90950933227,
      110581.74308347162,
      110666.85100536971,
      110619.14326203972,
      110563.51042806412,
      110660.43142974885,
      110523.24469913781,
      110724.89293566853,
      111081.23400933287,
      111120.66444717823,
      111233.74012205859,
      111280.13329637531,
      111116.19537609039,
      111202.50300098678,
      111118.80281737895,
      111347.47926907448,
      111201.3073627705,
      110968.97113583378,
      111057.5596575689,
      111232.34796307397,
      111325.77408290895,
      111096.43172052184,
      111271.50729228156,
      111133.09269636446,
      110836.31395611238,
      110858.36729079825,
      111245.9380531357,
      110952.3755840546,
      111020.74120294617,
      111150.0833279388,
      111249.96720226432,
      111630.32037940944,
      112045.71769353836,
      112019.40012143513,
      112071.36935811849,
      112024.44759077854,
      111996.26686941311,
      112489.14407785248,
      112601.63757963854,
      112434.7369592822,
      112206.36301124805,
      112456.23416521978,
      112067.347001549,
      112025.1685727209,
      112273.04214360457,
      112223.03656606357,
      112025.12878118771,
      111652.0713866927,
      111407.09074159958,
      111287.14885295804,
      111702.97471470888,
      112028.60805847727,
      112140.77309366502,
      113112.94201935548,
      113070.31854691613,
      112951.8697006361,
      112921.314592305,
      112717.27875782315,
      112500.52744001287,
      112676.69684972118,
      112774.8919592429,
      111729.81552424721,
      110870.22649131795,
      110976.01267464506,
      111031.54556997617,
      111145.96752255705,
      111319.25301235504,
      111359.19585339191,
      111301.75137263995,
      111518.10122362581,
      111521.54423183508,
      111062.11173220031,
      111023.09957073671,
      111397.55074284918,
      111525.92713938442,
      111521.6910568116,
      111567.4027745938,
      112528.44834154386,
      112363.70010957935,
      112249.77986728513,
      112321.22186740591,
      112255.32408911726,
      113426.4487582137,
      113934.39669773277,
      113891.18838609783,
      113903.95331929345,
      113672.21437753727,
      113734.63302411242,
      113592.01651974638,
      113402.84560367846,
      113625.82028845928,
      113885.30512691998,
      113935.59752053465,
    ];
  }
}
