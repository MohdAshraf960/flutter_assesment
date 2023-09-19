import 'package:currency/config/config.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

class AppException implements Exception {
  final String? message;
  final int? code;
  AppException({this.code, this.message});
  @override
  String toString() {
    if (message != null) {
      return "$code $message";
    } else {
      return "Something went wrong";
    }
  }

  static void onError(Object error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          AppSnackbar.showErrorSnackbar("Request Cancel");
          break;

        case DioErrorType.receiveTimeout:
          AppSnackbar.showErrorSnackbar("Receive Timeout");
          break;

        case DioErrorType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              AppSnackbar.showErrorSnackbar(
                  "${error.response?.data['message']}");
              break;

            case 401:
              AppSnackbar.showErrorSnackbar(
                  "${error.response?.data['message']}");
              break;

            case 403:
              AppSnackbar.showErrorSnackbar(
                  "${error.response?.data['message']}");
              break;

            case 404:
              AppSnackbar.showErrorSnackbar(
                  "${error.response?.data['message']}");
              break;

            case 408:
              AppSnackbar.showErrorSnackbar(
                  "${error.response?.data['message']}");
              break;

            case 409:
              AppSnackbar.showErrorSnackbar(
                  "${error.response?.data['message']}");
              break;

            case 500:
              AppSnackbar.showErrorSnackbar(
                  error.response?.data['message'] ?? "Internal Server Error");
              break;

            case 503:
              AppSnackbar.showErrorSnackbar(
                  "${error.response?.data['message']}");
              break;
          }
          break;

        case DioErrorType.connectionTimeout:
          AppSnackbar.showErrorSnackbar("Oops!!! Request time out");
          break;

        case DioErrorType.sendTimeout:
          AppSnackbar.showErrorSnackbar("sendTimeout");
          break;

        case DioErrorType.unknown:
          if (error.error is SocketException) {
            AppSnackbar.showErrorSnackbar("Unable to reach internet");

            return;
          }
          if (error.error is FormatException) {
            AppSnackbar.showErrorSnackbar("Invalid data format");
            return;
          }

          break;
        default:
      }

      return;
    }

    if (error is AppException) {
      AppSnackbar.showErrorSnackbar("${error.message}");
      return;
    }
    if (error is SocketException) {
      AppSnackbar.showErrorSnackbar(error.message);
      return;
    }
    if (error is FormatException) {
      AppSnackbar.showErrorSnackbar(error.message);
      return;
    }
    if (error is TimeoutException) {
      AppSnackbar.showErrorSnackbar("${error.message}");
      return;
    }
    if (error is Exception) {
      AppSnackbar.showErrorSnackbar(error.toString());
      return;
    }
  }
}
