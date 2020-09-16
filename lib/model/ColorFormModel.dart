import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

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

class MyColor extends FormzInput<Color, InputError> {
  const MyColor.pure() : super.pure(Colors.red);

  const MyColor.dirty({Color value = Colors.brown}) : super.dirty(value);

  @override
  InputError validator(Color value) {
    if (value == null) return InputError.empty;
    return null;
  }
}

class ColorName extends FormzInput<String, InputError> {
  const ColorName.pure() : super.pure("");

  const ColorName.dirty({String value = " "}) : super.dirty(value);

  @override
  InputError validator(String value) {
    if (value == "") return InputError.empty;
    if (value.length < 3 && value.length > 0) return InputError.small;
    return null;
  }
}
