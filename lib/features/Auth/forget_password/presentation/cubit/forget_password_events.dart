sealed class ForgetPasswordEvents {}

class FormValidationChangedEvent extends ForgetPasswordEvents {
  final bool isValid;
  FormValidationChangedEvent({required this.isValid});
}

class NavigateToNextpage extends ForgetPasswordEvents {}


class SendEmailEvent extends ForgetPasswordEvents {
  final String email;

  SendEmailEvent({required this.email});
}
