import 'package:json_annotation/json_annotation.dart';

part 'price_api_model.g.dart';

@JsonSerializable()
class PriceApiModel {
  PriceApiModel({
    required this.timestamp,
    required this.value,
  });

  factory PriceApiModel.fromJson(Map<String, dynamic> json) =>
      _$PriceApiModelFromJson(json);

  final int timestamp;
  final double value;

  Map<String, dynamic> toJson() => _$PriceApiModelToJson(this);
}
