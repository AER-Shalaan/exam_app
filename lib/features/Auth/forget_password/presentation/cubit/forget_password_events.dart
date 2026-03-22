sealed class ForgetPasswordEvents {}

class FormValidationChangedEvent extends ForgetPasswordEvents {
  final bool isValid;
  FormValidationChangedEvent({required this.isValid});
}

class SendEmailEvent extends ForgetPasswordEvents {
  final String email;

  SendEmailEvent({required this.email});
}

class VerifyResetCodeEvent extends ForgetPasswordEvents {
  final String code;
  VerifyResetCodeEvent({required this.code});
}

class ClearVerifyErrorEvent extends ForgetPasswordEvents {}

class ResendCodeEvent extends ForgetPasswordEvents {}

class ResetPasswordEvent extends ForgetPasswordEvents {
  final String password;
  ResetPasswordEvent({required this.password});
}
