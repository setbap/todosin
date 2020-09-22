import 'package:flutter/foundation.dart';

enum InputDateError { before, empty }

extension InputDateErrorString on InputDateError {
  String get name => describeEnum(this);
  String get errDescribe {
    switch (this) {
      case InputDateError.before:
        return "time must be in future";
      case InputDateError.empty:
        return "input must be filled with correct time";
      default:
        return null;
    }
  }
}
