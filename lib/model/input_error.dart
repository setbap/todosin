import 'package:flutter/foundation.dart';

enum InputError { empty, small }

extension InputErrorString on InputError {
  String get name => describeEnum(this);
  String get errDescribe {
    switch (this) {
      case InputError.empty:
        return "you must fill with value";
      case InputError.small:
        return "your input must at least 3 char";
      default:
        return null;
    }
  }
}
