abstract class AppRegex {
  static bool isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  static bool isValidPhoneNumber(String phone) {
    phone = phone.replaceAll(' ', '');

    final regex = RegExp(r'^(?:\+20|0)?1[0125][0-9]{8}$');

    return regex.hasMatch(phone);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*\d)').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return password.length >= 8;
  }

  static bool isValidPassword(String password) {
    return hasMinLength(password) &&
        hasUpperCase(password) &&
        hasLowerCase(password) &&
        hasNumber(password) &&
        hasSpecialCharacter(password);
  }
}
