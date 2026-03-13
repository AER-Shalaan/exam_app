
import 'package:exam_app/config/error/error_handler.dart';

class BaseError {
  static String handleException(Exception exception) {
    return ErrorHandler.handle(exception);
  }
}