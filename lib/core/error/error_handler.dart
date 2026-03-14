import 'package:dio/dio.dart';
import 'package:exam_app/core/values/app_strings.dart';

class ErrorHandler {
  static String handle(Exception exception) {
    if (exception is DioException) {
      if (exception.response != null) {
        final response = exception.response;

        if (response?.data != null &&
            response!.data is Map &&
            response.data[AppStrings.message] != null) {
          return response.data[AppStrings.message];
        }
      }

      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return AppStrings.connectiontimeout;

        case DioExceptionType.sendTimeout:
          return AppStrings.requestTimeout;

        case DioExceptionType.receiveTimeout:
          return AppStrings.servertooktoolongtorespond;

        case DioExceptionType.badCertificate:
          return AppStrings.badcertificate;

        case DioExceptionType.cancel:
          return AppStrings.cancel;

        case DioExceptionType.connectionError:
          return AppStrings.noInternetConnection;

        case DioExceptionType.unknown:
          return AppStrings.unexpectederroroccurred;

        case DioExceptionType.badResponse:
          return AppStrings.servererroroccurred;
      }
    }

    return AppStrings.somethingwentwrong;
  }
}
