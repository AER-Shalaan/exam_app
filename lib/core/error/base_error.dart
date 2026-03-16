
import 'package:exam_app/core/error/error_handler.dart';

class BaseError {
  static String handleException(Exception exception) {
    return ErrorHandler.handle(exception);
  }
}
