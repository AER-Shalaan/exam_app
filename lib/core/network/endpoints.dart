class Endpoints {
  Endpoints._();

  static const String baseUrl = 'https://exam.elevateegy.com/api/v1';
  static const String postSignInEndpoint = '$baseUrl/auth/signin';
  static const String postSignUpEndpoint = '$baseUrl/auth/signup';
  static const String postForgotPasswordEndpoint =
      '$baseUrl/auth/forgotPassword';
  static const String patchChangePasswordEndpoint =
      '$baseUrl/auth/changePassword';
  static const String postVerifyResetCodeEndpoint =
      '$baseUrl/auth/verifyResetCode';
  static const String putResetPasswordEndpoint = '$baseUrl/auth/resetPassword';
  static const String getProfileDataEndpoint = '$baseUrl/auth/profileData';
  static const String putEditProfileEndpoint = '$baseUrl/auth/editProfile';
  static const String deleteMyAccountEndpoint = '$baseUrl/auth/deleteMe';
  static const String getLogoutEndpoint = '$baseUrl/auth/logout';

  static const String getAllSubjectsEndpoint = '$baseUrl/subjects';
}
