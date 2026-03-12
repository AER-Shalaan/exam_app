import 'package:dio/dio.dart';

 class ErrorHandler {
  static String handle(Exception exception) {
    if (exception is DioException) {
      if (exception.response != null) {
        final response = exception.response;

        if (response?.data != null &&
            response!.data is Map &&
            response.data['message'] != null) {
          return response.data['message'];
        }
      }

      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout, please try again";

        case DioExceptionType.sendTimeout:
          return "Request timeout";

        case DioExceptionType.receiveTimeout:
          return "Server took too long to respond";

        case DioExceptionType.badCertificate:
          return "Bad certificate";

        case DioExceptionType.cancel:
          return "Request was cancelled";

        case DioExceptionType.connectionError:
          return "No internet connection";

        case DioExceptionType.unknown:
          return "Unexpected error occurred";

        case DioExceptionType.badResponse:
          return "Server error occurred";
      }
    }

    return "Something went wrong";
  }
}
