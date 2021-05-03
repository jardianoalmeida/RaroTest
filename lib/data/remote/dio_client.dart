import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_snow_base/flutter_snow_base.dart' as log;
import 'package:raro_test/data/constants/constants.dart';

@singleton
class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.connectTimeout = 10000;
    _dio.options.sendTimeout = 10000;
    _dio.options.receiveTimeout = 10000;

    _dio.interceptors.add(log.LogInterceptor());
    _dio.options.baseUrl = flavor.baseUrl;

    _dio.options.headers.addAll({
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNTkwNzc1NjQ2LCJleHAiOjE1OTMzNjc2NDZ9.CP_xj_cdDlLtw0YuWbD-fKvvn-HDN52rAYmNu3j2CC4"
    });
  }

  Future<T> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    return _dio
        .delete<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            extra: extra,
          ),
        )
        .then((value) => value.data!);
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    onReceiveProgress,
  }) async {
    return _dio
        .get<T>(
          path,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            extra: extra,
          ),
        )
        .then((value) => value.data!);
  }

  Future<T> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    return _dio
        .patch<T>(
          path,
          data: data,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            extra: extra,
          ),
        )
        .then((value) => value.data!);
  }

  Future<T> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    return _dio
        .post<T>(
          path,
          data: data,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            extra: extra,
          ),
        )
        .then((value) => value.data!);
  }

  Future<T> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    return _dio
        .put<T>(
          path,
          data: data,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
            extra: extra,
          ),
        )
        .then((value) => value.data!);
  }
}
