import 'package:json_annotation/json_annotation.dart';
part 'spark_line_api_model.g.dart';

@JsonSerializable()
class SparkLineApiModel {
  SparkLineApiModel({required this.price});

  factory SparkLineApiModel.fromJson(Map<String, dynamic> json) =>
      _$SparkLineApiModelFromJson(json);

  final List<double> price;

  Map<String, dynamic> toJson() => _$SparkLineApiModelToJson(this);
}
