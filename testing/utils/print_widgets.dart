import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void printWidgets<T>(CommonFinders find) {
  final widgets = find.byType(T);
  widgets.evaluate().forEach((element) {
    final widget = element.widget as T;
    if (widget is Text) {
      final text = (widget as Text).data;
      debugPrint('Text visível: $text');
    } else {
      debugPrint('Widget visível: $widget');
    }
  });
}
