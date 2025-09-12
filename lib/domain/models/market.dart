import 'package:brasil_cripto/data/services/api/models/market_api_model.dart';

class Market {
  Market({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });
  factory Market.fromApi(MarketApiModel model) {
    return Market(
      marketCaps: model.marketCaps,
      totalVolumes: model.totalVolumes,
      prices: model.totalVolumes,
    );
  }
  final List<List<double>> prices;
  final List<List<double>> marketCaps;
  final List<List<double>> totalVolumes;
}
