abstract class AppStrings {
  static const appName = "Exam App";
  static const splashScreenTitle = "Welcome to Exam App";
  static const masterYourExams = "Master Your Exams";
  // Titles
  static const examTitle = "Exam";
  static const loginTitle = "Login";
  static const signUpTitle = "Sign Up";
  static const homeTitle = "Survey";

  // Auth
  static const alreadyhaveanaccount = "Already have an account? ";
  static const dontAcont = "Don't have an account? ";
  static const rememberMe = "Remember me";

  // Fields
  static const userName = "User name";
  static const usernameHint = "Enter your user name";
  static const firstName = "First name";
  static const firstnameHint = "Enter first name";
  static const lastName = "Last name";
  static const lastnameHint = "Enter last name";
  static const email = "Email";
  static const emailHint = "Enter your email";
  static const phone = "Phone number";
  static const phoneHint = "Enter phone number";
  static const password = "Password";
  static const passwordHint = "Enter your password";
  static const confirmPassword = "Confirm password";
  static const confirmPasswordHint = "Enter your confirm password";
  static const search = "Search";

  // Browse
  static const browseBySubject = "Browse by subject";

  // Validation
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

  // Forgot Password
  static const forgotPasswordTitle = "Forgot Password";
  static const forgotPasswordDescription =
      "Please enter your email associated to\nyour account";

  // Reset Password
  static const newPassword = 'New password';
  static const resetPassword = "Reset password";
  static const resetPasswordDescription =
      "Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least ";

  // Verification
  static const verifyCodeTitle = "Email verification";
  static const verifyCodeDescription =
      "Please enter your code that send to\n your email address";
  static const resendCodeString = "Didn't receive the code? ";
  static const resend = "Resend";

  // Success
  static const passwordChanged = "Password Changed";
  static const passwordChangedDescription =
      "Password changed successfully.\nPlease login again.";
  static const registersuccessfuly = "Register Successfully";
  static const resendCodeSuccess =
      "The OTP has been sent back to your email address.";
  static const profileUpdatedSuccessfully = "Profile updated successfully";

  // Nav bar
  static const explore = "Explore";
  static const result = "Result";
  static const profile = "Profile";

  // General
  static const continueString = "Continue";
  static const resending = "Resending code...";
  static const update = "Update";
  static const change = "Change";
  static const changePassword = "Change Password";
  static const oldPassword = "Old Password";
  static const confirmNewPassword = "Confirm New Password";
  static const cancelBtn = "Cancel";
  static const other = "Other";
  static const seconds = "seconds";

  static String resendIn(int seconds) =>
      "Resend in $seconds ${seconds == 1 ? 'second' : 'seconds'}";
  static String correctedAnswersIn(int numOfQuestions, String time) =>
      "$numOfQuestions corrected answers in $time";

  // Errors
  static const noInternetConnection = "No internet connection";
  static const connectionTimeout = "Connection timeout, please try again";
  static const requestTimeout = "Request timeout";
  static const serverTookTooLongToRespond = "Server took too long to respond";
  static const badcertificate = "Bad certificate";
  static const cancel = "Request was cancelled";
  static const connectionerror = "No internet connection";
  static const unexpectederroroccurred = "Unexpected error occurred";
  static const servererroroccurred = "Server error occurred";
  static const somethingwentwrong = "Something went wrong";
  static const message = "message";
  static const noSubjectsFound = "No subjects found";
  static const emailNotFound = "Email not found. Please restart flow.";
  static const routeNotFound = "Route Not Found";
  static const noUserDataAvailable = "No user data available";
  static const noResultsYet = "No results yet";

  // Exams
  static const exams = "Exams";
  static const noExamsAvailable = "No exams available";
  static const start = "Start";
  static const examLevel = "High level";
  static const dummyInstruction = "Lorem ipsum dolor sit amet consectetur.";
  static const minutes = "Minutes";
  static const questions = "Questions";
  static const from = "From: ";
  static const to = "To: ";
  static const fromTime = "1.00";
  static const toTime = "6.00";
  static const defaultExamTitle = "Exam Title";
  static const placeholderExamTitle = "Placeholder Exam Title Here";
  static const answers = "Answers";
}
