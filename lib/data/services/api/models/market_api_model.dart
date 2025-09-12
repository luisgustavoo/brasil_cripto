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
  final List<List<double>> prices;

  @JsonKey(name: 'market_caps')
  final List<List<double>> marketCaps;

  @JsonKey(name: 'total_volumes')
  final List<List<double>> totalVolumes;

  Map<String, dynamic> toJson() => _$MarketApiModelToJson(this);
}
