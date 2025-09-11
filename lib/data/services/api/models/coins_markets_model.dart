import 'package:brasil_cripto/data/services/api/models/spark_line.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coins_markets_model.g.dart';

@JsonSerializable()
class CoinsMarketsModel {
  CoinsMarketsModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
    this.sparkLineIn7d,
    this.priceChangePercentage1hInCurrency,
    this.priceChangePercentage24hInCurrency,
    this.priceChangePercentage7dInCurrency,
  });

  factory CoinsMarketsModel.fromJson(Map<String, dynamic> json) =>
      _$CoinsMarketsModelFromJson(json);

  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double? fullyDilutedValuation;
  final double? totalVolume;
  @JsonKey(name: 'high_24h')
  final double? high24h;
  @JsonKey(name: 'low_24h')
  final double? low24h;
  @JsonKey(name: 'price_change_24h')
  final double? priceChange24h;
  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24h;
  @JsonKey(name: 'market_cap_change_24h')
  final double? marketCapChange24h;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double? marketCapChangePercentage24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final String? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final String? atlDate;
  final dynamic roi;
  final String? lastUpdated;
  @JsonKey(name: 'sparkline_in_7d')
  final SparkLine? sparkLineIn7d;
  @JsonKey(name: 'price_change_percentage_1h_in_currency')
  final double? priceChangePercentage1hInCurrency;
  @JsonKey(name: 'price_change_percentage_24h_in_currency')
  final double? priceChangePercentage24hInCurrency;
  @JsonKey(name: 'price_change_percentage_7d_in_currency')
  final double? priceChangePercentage7dInCurrency;

  Map<String, dynamic> toJson() => _$CoinsMarketsModelToJson(this);
}
