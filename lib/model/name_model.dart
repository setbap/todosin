import 'package:formz/formz.dart';

import 'input_error.dart';

class Name extends FormzInput<String, InputError> {
  const Name.pure() : super.pure("");

  const Name.dirty({String value = " "}) : super.dirty(value);

  @override
  InputError validator(String value) {
    if (value == "") return InputError.empty;
    if (value.length < 3 && value.length > 0) return InputError.small;
    return null;
  }
}
