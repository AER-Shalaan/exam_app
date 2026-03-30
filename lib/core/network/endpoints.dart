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
  //=================================question=========================
  // انت مش هتضيف سؤال ولا حاجة من دول انت بس هتجيب الاسئلة بتاعة الامتحان
  // و تخزن الاجابات بال id بتاع السؤال و ال time بتاع الامتحان كله و بعد كده تبعته في ال  post check question endpoint و هو هيقولك صح ولا غلط
  // ده بس اللي هتستخدمه  get all questions on exam و هتبعت في ال headers بتاعته ال token و في ال query هتبعت examId
  static const String postAddQuestionEndpoint = '$baseUrl/questions';
  static const String getAllQuestionEndpoint = '$baseUrl/questions';
  static const String getAllQuestionInExamEndpoint = '$baseUrl/questions';
  static const String getSingleQuestionEndpoint = '$baseUrl/questions';
  static const String getUserHistoryEndpoint = '$baseUrl/questions/history';
  static const String postCheckQuestionEndpoint = '$baseUrl/questions/check';
}
