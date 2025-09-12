import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/data/services/api/models/spark_line.dart';
import 'package:flutter/foundation.dart';

@immutable
class Coin {
  const Coin({
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

  factory Coin.fromApi(CoinsMarketsModel model) {
    return Coin(
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

  @override
  bool operator ==(covariant Coin other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.symbol == symbol &&
        other.name == name &&
        other.image == image &&
        other.currentPrice == currentPrice &&
        other.marketCap == marketCap &&
        other.marketCapRank == marketCapRank &&
        other.fullyDilutedValuation == fullyDilutedValuation &&
        other.totalVolume == totalVolume &&
        other.sparkLineIn7d == sparkLineIn7d &&
        other.priceChangePercentage1hInCurrency ==
            priceChangePercentage1hInCurrency &&
        other.priceChangePercentage24hInCurrency ==
            priceChangePercentage24hInCurrency &&
        other.priceChangePercentage7dInCurrency ==
            priceChangePercentage7dInCurrency;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        image.hashCode ^
        currentPrice.hashCode ^
        marketCap.hashCode ^
        marketCapRank.hashCode ^
        fullyDilutedValuation.hashCode ^
        totalVolume.hashCode ^
        sparkLineIn7d.hashCode ^
        priceChangePercentage1hInCurrency.hashCode ^
        priceChangePercentage24hInCurrency.hashCode ^
        priceChangePercentage7dInCurrency.hashCode;
  }
}
