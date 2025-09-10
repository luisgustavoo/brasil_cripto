import 'package:json_annotation/json_annotation.dart';
part 'spark_line.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SparkLine {
  SparkLine({required this.price});

  factory SparkLine.fromJson(Map<String, dynamic> json) =>
      _$SparkLineFromJson(json);

  final List<double> price;

  Map<String, dynamic> toJson() => _$SparkLineToJson(this);
}
