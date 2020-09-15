import 'package:formz/formz.dart';

enum InputError { empty, middle }

class Username extends FormzInput<String, InputError> {
  const Username.pure() : super.pure("");

  const Username.dirty({String value = " "}) : super.dirty(value);

  @override
  InputError validator(String value) {
    if (value == "") return InputError.empty;
    if (value.length > 3 && value.length < 7) return InputError.middle;
    return null;
  }
}

class Password extends FormzInput<String, InputError> {
  const Password.pure() : super.pure("");

  const Password.dirty({String value = " "}) : super.dirty(value);

  @override
  InputError validator(String value) {
    if (value == "") return InputError.empty;
    if (value.length > 3 && value.length < 7) return InputError.middle;
    return null;
  }
}
