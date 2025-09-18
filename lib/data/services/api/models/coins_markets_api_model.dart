// ignore_for_file: invalid_annotation_target
import 'package:brasil_cripto/data/services/api/models/spark_line_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coins_markets_api_model.freezed.dart';
part 'coins_markets_api_model.g.dart';

@freezed
abstract class CoinsMarketsApiModel with _$CoinsMarketsApiModel {
  const factory CoinsMarketsApiModel({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required double currentPrice,
    required double marketCap,
    required int marketCapRank,
    @JsonKey(name: 'sparkline_in_7d') required SparkLineApiModel sparkLineIn7d,
    @JsonKey(name: 'price_change_percentage_1h_in_currency')
    required double priceChangePercentage1hInCurrency,
    @JsonKey(name: 'price_change_percentage_24h_in_currency')
    required double priceChangePercentage24hInCurrency,
    @JsonKey(name: 'price_change_percentage_7d_in_currency')
    required double priceChangePercentage7dInCurrency,
    required double totalVolume,
    double? fullyDilutedValuation,
    double? high24h,
    double? low24h,
    double? priceChange24h,
    double? priceChangePercentage24h,
    double? marketCapChange24h,
    double? marketCapChangePercentage24h,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
    double? ath,
    double? athChangePercentage,
    String? athDate,
    double? atl,
    double? atlChangePercentage,
    String? atlDate,
    dynamic roi,
    String? lastUpdated,
  }) = _CoinsMarketsApiModel;

  factory CoinsMarketsApiModel.fromJson(Map<String, dynamic> json) =>
      _$CoinsMarketsApiModelFromJson(json);
}
