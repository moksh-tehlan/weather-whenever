import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_whenever/data/network/api/endpoints.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = const Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout = const Duration(milliseconds: Endpoints.receiveTimeout)
      ..options.responseType = ResponseType.json
      ..interceptors.add(PrettyDioLogger())
      ..interceptors.add(InterceptorsWrapper(
        onError: (e, handler) async {
          handler.reject(e);

          if (e.type == DioErrorType.unknown && e.error is SocketException) {
            await Fluttertoast.showToast(
              msg: 'Please check your internet connection',
            );
          }
          if (e.type == DioErrorType.connectionTimeout ||
              e.type == DioErrorType.receiveTimeout) {
            await Fluttertoast.showToast(
              msg: 'Servers are busy pleast try again later!!',
            );
          }
        },
      ));
  }

  // Get :-----------------------------------------------------------

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
