import 'package:flutter/widgets.dart';

extension WidgetPadding on Widget {
  /// Wrapp [widget] with [Padding] and aplly [input] to x axis
  Widget px(double paddingX) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingX),
      child: this,
    );
  }

  /// Wrapp [widget] with [Padding] and aplly [input] to y axis
  Widget py(double paddingY) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingY),
      child: this,
    );
  }

  /// Wrapp [widget] with [Padding] and aplly [input] to all side
  Widget p(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}
