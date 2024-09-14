import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:palpagaio/network/http/interceptors/authorization_interceptor.dart';

Dio createGenericInstance(BaseOptions options) {
  final dio = Dio(options);
  dio.interceptors.add(AuthorizationInterceptor());
  return dio;
}

class Api {
  static Dio speech() {
    return createGenericInstance(
      BaseOptions(
        baseUrl: dotenv.env['SPEECH_API_URL']!,
        contentType: 'application/json',
      ),
    );
  }
}
