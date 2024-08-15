import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getdDio() {
    Duration time = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = time
        ..options.receiveTimeout = time;
      _addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }
}
