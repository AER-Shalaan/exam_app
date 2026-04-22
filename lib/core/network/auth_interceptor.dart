import 'package:dio/dio.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = TokenManager.token;
    if (token != null) {
      options.headers['token'] = token;
    }
    return super.onRequest(options, handler);
  }
}
