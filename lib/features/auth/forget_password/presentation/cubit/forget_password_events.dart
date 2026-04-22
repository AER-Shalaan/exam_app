sealed class ForgetPasswordEvents {}

class SendEmailEvent extends ForgetPasswordEvents {
  final String email;
  SendEmailEvent({required this.email});
}

class VerifyResetCodeEvent extends ForgetPasswordEvents {
  final String code;
  VerifyResetCodeEvent({required this.code});
}

class NextPageEvent extends ForgetPasswordEvents {}

class ClearVerifyCodeErrorEvent extends ForgetPasswordEvents {}

class ResendCodeEvent extends ForgetPasswordEvents {}

class ResetPasswordEvent extends ForgetPasswordEvents {
  final String password;
  ResetPasswordEvent({required this.password});
}
