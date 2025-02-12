import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/core/utils/strings.dart';

class FormValidation {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return AppStrings.nameIsRequired;
    }
    return null;
  }

  /////////////////////////////
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppStrings.passwordIsRequired;
    }
    if (value.length < 8) {
      return AppStrings.invalidPassword;
    }
    return null;
  }

  /////////////////////////////
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return AppStrings.emailIsRequired;
    }

    final regex = RegExp(kPattern);
    if (!regex.hasMatch(value)) {
      return AppStrings.invalidEmail;
    }

    return null;
  }
}
