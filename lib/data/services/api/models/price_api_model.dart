import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_api_model.freezed.dart';
part 'price_api_model.g.dart';

@freezed
abstract class PriceApiModel with _$PriceApiModel {
  const factory PriceApiModel({
    required int timestamp,
    required double value,
  }) = _PriceApiModel;

  factory PriceApiModel.fromJson(Map<String, dynamic> json) =>
      _$PriceApiModelFromJson(json);
}
