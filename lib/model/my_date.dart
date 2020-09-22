import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:todosin/model/input_date_error.dart';

class MyDate extends FormzInput<DateTime, InputDateError> {
  MyDate.pure() : super.pure(DateTime.now());

  MyDate.dirty({@required DateTime value}) : super.dirty(value);

  @override
  InputDateError validator(DateTime value) {
    if (value == null) return InputDateError.before;
    if (value.isAfter(DateTime.now().subtract(Duration(seconds: 1))))
      return InputDateError.empty;
    return null;
  }
}
