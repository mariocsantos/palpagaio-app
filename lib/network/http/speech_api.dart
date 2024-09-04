import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio createGenericInstance(BaseOptions options) {
  final dio = Dio(options);
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
