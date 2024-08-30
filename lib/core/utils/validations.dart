import 'package:get/get.dart';

import '../../localization/app_localization.dart';

class Validations {
  static String? emptyValidator(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? AppLocalization.requiredField.tr;
    }
    return null;
  }

  static bool isEmptyValidator(String? value) {
    return value == null || value.isEmpty;
  }

  static String? emailValidator(String? value, {String? message}) {
    if (isEmptyValidator(value)) {
      return AppLocalization.requiredField.tr;
    }
    if (!GetUtils.isEmail(value!)) {
      return message ?? AppLocalization.pleaseEnterValidEmail.tr;
    }
    return null;
  }

  static String? passwordValidator(String? value,
      {int min = 6, max = 30, String? confirmPass}) {
    if (isEmptyValidator(value)) {
      return AppLocalization.requiredField.tr;
    }
    if (GetUtils.isLengthLessThan(value!, min)) {
      return AppLocalization.shortPasswordRule.tr;
    }
    if (GetUtils.isLengthGreaterThan(value, max)) {
      return AppLocalization.longPasswordRule.tr;
    }
    if (confirmPass != null && value != confirmPass) {
      return AppLocalization.passwordsDoesNotMatch.tr;
    }
    return null;
  }

  static String? phoneValidation(String? value) {
    if (isEmptyValidator(value)) {
      return AppLocalization.requiredField;
    }
    if (GetUtils.isLengthLessThan(value!, 8)) {
      return AppLocalization.error;
    }
    if (GetUtils.isLengthGreaterThan(value, 15)) {
      return AppLocalization.error;
    }
    return null;
  }
}
