import 'package:formz/formz.dart';

import 'input_error.dart';

class IdValue extends FormzInput<String, InputError> {
  const IdValue.pure() : super.pure(null);

  const IdValue.dirty({String value = ""}) : super.dirty(value);

  @override
  InputError validator(String value) {
    if (value == null || value == "") return InputError.empty;
    return null;
  }
}
