import 'package:dio/dio.dart';

class DioClient {
  static late Dio _dio;
  static DioClient? _singleton;
  Dio get instance => _dio;

  DioClient._() {
    _dio = createDioClient();
  }

  factory DioClient() {
    return _singleton ??= DioClient._();
  }

  Dio createDioClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:8000/api/",
        receiveTimeout: Duration(milliseconds: 15000), // 15 seconds
        connectTimeout: Duration(milliseconds: 15000),
        sendTimeout: Duration( milliseconds: 15000),
        headers: {
          Headers.acceptHeader: 'application/json',
          Headers.contentTypeHeader: 'application/json',
        },
      ),
    );
    return dio;
  }
}
