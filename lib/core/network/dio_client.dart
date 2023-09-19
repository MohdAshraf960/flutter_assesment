import 'package:currency/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _defaultConnectTimeout = Duration(seconds: 60);
const _defaultReceiveTimeout = Duration(seconds: 60);

class DioClient {
  late Dio _dio;
  late final List<Interceptor>? interceptors;

  DioClient(Dio dio, {this.interceptors}) {
    _dio = dio;
    _dio
      ..options.baseUrl = dotenv.env['API_URL']!
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout;

    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: kDebugMode ? true : false,
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          responseHeader: false,
          error: kDebugMode ? true : false,
          compact: true,
          maxWidth: 120),
    );
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(uri);
      final statusCode = response.statusCode;
      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data == null) {
          return;
        } else {
          return response.data;
        }
      } else {
        throw AppException(
            code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final statusCode = response.statusCode;
      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data == null) {
          return;
        } else {
          return response.data;
        }
      } else {
        throw AppException(
            code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      final statusCode = response.statusCode;

      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data.isEmpty) {
          return;
        } else {
          return response.data;
        }
      } else {
        throw AppException(
            code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final statusCode = response.statusCode;

      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data.isEmpty) {
          return;
        } else {
          return response.data;
        }
      } else {
        throw AppException(
            code: response.statusCode, message: "${response.data}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
