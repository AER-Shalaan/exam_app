abstract class AppStrings {
  static const appName = "Exam App";
  static const splashScreenTitle = "Welcome to Exam App";
  static const signUpTitle = "Sign Up";
  static const loginTitle = "Login";
  static const forgotPasswordTitle = "Forget password";
  static const forgotPasswordDescription =
      "Please enter your email associated to\nyour account";
  static const email = 'Email';
  static const emailHint = "Enter your email";
  static const password = 'Password';
  static const newPassword = 'New password';
  static const confirmPassword = 'Confirm password';
  static const passwordHint = "Enter your password";
  static const confirmPasswordHint = "Enter your confirm password";
  static const login = "Login";
  static const signUp = "Sign Up";
  static const verifyCodeTitle = "Email verification";
  static const verifyCodeDescription =
      "Please enter your code that send to\n your email address";
  static const resendCodeString = "Didn't receive the code? ";
  static const resend = "Resend";
  static const resetPassword = "Reset password";
  static const resetPasswordDescription =
      "Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least ";
  static const passwordChanged = "Password Changed";
  static const passwordChangedDescription =
      "Password changed successfully.\nPlease login again.";
  static const fieldCannotBeEmpty = 'This field cannot be empty';
  static const emailCannotBeEmpty = 'Email address cannot be empty';
  static const invalidEmail = 'Invalid email address.';
  static const phoneCannotBeEmpty = 'Mobile number cannot be empty';
  static const invalidPhone = 'Invalid phone number';
  static const passwordCannotBeEmpty = 'Password cannot be empty';
  static const passwordTooWeak = 'Password is too weak.';
  static const confirmPasswordCannotBeEmpty =
      'Confirm password cannot be empty';
  static const passwordsDoNotMatch = 'Passwords do not match.';
  static const continueString = "Continue";
  static const resendCodeSuccess =
      "The OTP has been sent back to your email address.";
  static const emailNotFound = "Email not found. Please restart flow.";
  static const routeNotFound = "Route Not Found";
  static const resending = "Resending code...";
  static String resendIn(int seconds) =>
      "Resend in $seconds ${seconds == 1 ? 'second' : 'seconds'}";
}
