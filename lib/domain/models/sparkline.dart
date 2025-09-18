import 'package:freezed_annotation/freezed_annotation.dart';

part 'sparkline.freezed.dart';

@freezed
abstract class Sparkline with _$Sparkline {
  const factory Sparkline({
    required List<double> price,
  }) = _Sparkline;
}
