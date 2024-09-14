import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthorizationInterceptor extends Interceptor {
  Future<String?> _getAccessToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String? idToken = await user.getIdToken(true);
      return idToken;
    } else {
      return null;
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? authorizationHeader = options.headers['Authorization'];

    if (authorizationHeader != null && authorizationHeader.isNotEmpty) {
      return super.onRequest(options, handler);
    }

    final accessToken = await _getAccessToken();

    options.headers.addAll(
      {'Authorization': 'Bearer $accessToken'},
    );

    return super.onRequest(options, handler);
  }

  // @override
  // Future onError(
  //   DioException err,
  //   ErrorInterceptorHandler handler,
  // ) async {
  //   final response = err.response;
  //   final requestOptions = err.requestOptions;

  //   if (response?.statusCode != 401 ||
  //       requestOptions.headers['Retry-Count'] == 1) {
  //     return super.onError(err, handler);
  //   }

  //   try {
  //     final authRepository = AuthRepository();
  //     final tokens = await authRepository.refreshAccessToken();

  //     requestOptions.headers.addAll(
  //       {'Retry-Count': 1, 'Authorization': 'Bearer ${tokens.accessToken}'},
  //     );

  //     final authApi = ZucApi.auth();
  //     final newResponse = await authApi.fetch(requestOptions);

  //     handler.resolve(newResponse);
  //   } catch (_) {
  //     return super.onError(err, handler);
  //   }
  // }
}
