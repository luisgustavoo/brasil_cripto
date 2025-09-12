import 'package:brasil_cripto/data/services/api/models/price_api_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'market_api_model.g.dart';

@JsonSerializable()
class MarketApiModel {
  MarketApiModel({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  factory MarketApiModel.fromJson(Map<String, dynamic> json) =>
      _$MarketApiModelFromJson(json);

  @JsonKey(name: 'prices')
  final List<PriceApiModel> prices;

  @JsonKey(name: 'market_caps')
  final List<PriceApiModel> marketCaps;

  @JsonKey(name: 'total_volumes')
  final List<PriceApiModel> totalVolumes;

  Map<String, dynamic> toJson() => _$MarketApiModelToJson(this);
}
