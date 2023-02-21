import 'package:dark_week/app/core/config/env/env.dart';
import 'package:dark_week/app/core/rest_client/interceptor/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptor;

  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? '',
            connectTimeout: 5000,
            receiveTimeout: 60000,
          ),
        ) {
    interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
    _authInterceptor = AuthInterceptor();
  }
  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
