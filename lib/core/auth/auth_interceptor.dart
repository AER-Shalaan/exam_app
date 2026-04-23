import 'package:dio/dio.dart';
import 'package:exam_app/core/auth/token_manager.dart';
import 'package:exam_app/core/network/api_param.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requiresAuth = options.extra[ApiParam.requiresAuth] ?? true;

    if (requiresAuth) {
      final token = TokenManager.token;
      if (token != null) {
        options.headers[ApiParam.token] = token;
      }
    }

    return super.onRequest(options, handler);
  }
}
