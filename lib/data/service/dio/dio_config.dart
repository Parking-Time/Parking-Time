import 'package:dio/dio.dart';
import 'package:parking_time/utils/env/env.dart';

class DioConfig {
  static Dio instance = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    ),
  )..interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
  ));
}
