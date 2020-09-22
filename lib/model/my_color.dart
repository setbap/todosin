import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import 'input_error.dart';

class MyColor extends FormzInput<Color, InputError> {
  const MyColor.pure() : super.pure(Colors.red);

  const MyColor.dirty({Color value = Colors.brown}) : super.dirty(value);

  @override
  InputError validator(Color value) {
    if (value == null) return InputError.empty;
    return null;
  }
}
