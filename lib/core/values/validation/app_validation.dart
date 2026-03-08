import 'package:exam_app/core/values/app_strings.dart';
import 'package:exam_app/core/values/validation/app_regex.dart';

class AppValidation {
  AppValidation._();

  static String? _checkNullOrEmpty(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateRequired(
    String? value, {
    String message = AppStrings.fieldCannotBeEmpty,
  }) {
    return _checkNullOrEmpty(value, message);
  }

  static String? validateEmail(String? email, {bool required = false}) {
    if (required) {
      final emptyCheck = _checkNullOrEmpty(
        email,
        AppStrings.emailCannotBeEmpty,
      );
      if (emptyCheck != null) return emptyCheck;
    }

    if (email == null || email.trim().isEmpty) {
      return null;
    }

    final normalizedEmail = email.trim().toLowerCase();

    if (!AppRegex.isValidEmail(normalizedEmail)) {
      return AppStrings.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? password) {
    final emptyCheck = _checkNullOrEmpty(
      password,
      AppStrings.passwordCannotBeEmpty,
    );

    if (emptyCheck != null) return emptyCheck;

    if (!AppRegex.isValidPassword(password!)) {
      return AppStrings.passwordTooWeak;
    }

    return null;
  }

  static String? validatePasswordConfirmation(
    String? password,
    String? confirmPassword,
  ) {
    final confirmCheck = _checkNullOrEmpty(
      confirmPassword,
      AppStrings.confirmPasswordCannotBeEmpty,
    );

    if (confirmCheck != null) return confirmCheck;

    if ((password ?? '') != confirmPassword) {
      return AppStrings.passwordsDoNotMatch;
    }

    return null;
  }

  static String? validatePhone(String? phone) {
    final emptyCheck = _checkNullOrEmpty(phone, AppStrings.phoneCannotBeEmpty);

    if (emptyCheck != null) return emptyCheck;

    if (!AppRegex.isValidPhoneNumber(phone!)) {
      return AppStrings.invalidPhone;
    }

    return null;
  }
}
