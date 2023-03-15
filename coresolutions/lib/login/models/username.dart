import 'package:formz/formz.dart';

enum UsernameValidationError { empty, invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  @override
  UsernameValidationError? validator(String? value) {
    if (value?.isNotEmpty == false) {
      return UsernameValidationError.empty;
    } else if (!_emailRegExp.hasMatch(value!)) {
      return UsernameValidationError.invalid;
    } else {
      return null;
    }
  }
}
