import 'package:brasil_cripto/data/services/api/models/spark_line_api_model.dart';

class Sparkline {
  Sparkline({
    required this.price,
  });

  factory Sparkline.fromApi(SparkLineApiModel model) {
    return Sparkline(
      price: model.price,
    );
  }

  final List<double> price;
}
