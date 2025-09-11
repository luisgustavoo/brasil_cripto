import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/api/models/spark_line.dart';

class CoinsMarkets {
  CoinsMarkets({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.sparkLineIn7d,
    required this.priceChangePercentage1hInCurrency,
    required this.priceChangePercentage24hInCurrency,
    required this.priceChangePercentage7dInCurrency,
  });

  factory CoinsMarkets.fromApi(CoinsMarketsModel model) {
    return CoinsMarkets(
      id: model.id,
      symbol: model.symbol,
      name: model.name,
      image: model.image,
      currentPrice: model.currentPrice,
      marketCap: model.marketCap,
      marketCapRank: model.marketCapRank,
      fullyDilutedValuation: model.fullyDilutedValuation ?? 0,
      totalVolume: model.totalVolume ?? 0,
      sparkLineIn7d: model.sparkLineIn7d ?? SparkLine(price: []),
      priceChangePercentage1hInCurrency:
          model.priceChangePercentage1hInCurrency ?? 0,
      priceChangePercentage24hInCurrency:
          model.priceChangePercentage24hInCurrency ?? 0,
      priceChangePercentage7dInCurrency:
          model.priceChangePercentage7dInCurrency ?? 0,
    );
  }

  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double fullyDilutedValuation;
  final double totalVolume;
  final SparkLine sparkLineIn7d;
  final double priceChangePercentage1hInCurrency;
  final double priceChangePercentage24hInCurrency;
  final double priceChangePercentage7dInCurrency;
}
