import 'package:freezed_annotation/freezed_annotation.dart';

part 'spark_line_api_model.freezed.dart';
part 'spark_line_api_model.g.dart';

@Freezed(fromJson: true, toJson: true)
abstract class SparkLineApiModel with _$SparkLineApiModel {
  const factory SparkLineApiModel({required List<double> price}) =
      _SparkLineApiModel;

  factory SparkLineApiModel.fromJson(Map<String, dynamic> json) =>
      _$SparkLineApiModelFromJson(json);
}
