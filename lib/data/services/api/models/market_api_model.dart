import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_api_model.freezed.dart';
part 'market_api_model.g.dart';

@freezed
abstract class MarketApiModel with _$MarketApiModel {
  const factory MarketApiModel({
    required List<List<double>> prices,
    required List<List<double>> marketCaps,
    required List<List<double>> totalVolumes,
  }) = _MarketApiModel;

  factory MarketApiModel.fromJson(Map<String, dynamic> json) =>
      _$MarketApiModelFromJson(json);
}
