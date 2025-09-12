import 'package:brasil_cripto/data/services/api/models/price_api_model.dart';

class Price {
  Price({
    required this.timestamp,
    required this.value,
  });
  factory Price.fromApi(PriceApiModel model) {
    return Price(
      timestamp: model.timestamp,
      value: model.value,
    );
  }
  final int timestamp;
  final double value;
}
