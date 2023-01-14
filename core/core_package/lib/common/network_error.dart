import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'error.dart';

enum NetworkErrorType {
  network,
  badRequest,
  forbidden,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown,
}

class NetworkError extends AppError {
  NetworkError({
    required super.error,
    required super.message,
    required super.type,
    required super.stackTrace,
  });
  factory NetworkError.fromError(
    Object error,
    StackTrace stackTrace,
  ) {
    String message;
    Enum type;
    if (error is DioError) {
      debugPrint('AppError(DioError): '
          'type is ${error.type}, message is ${error.message}');
      message = error.message;
      switch (error.type) {
        case DioErrorType.other:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = NetworkErrorType.network;
          } else {
            type = NetworkErrorType.unknown;
          }
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          type = NetworkErrorType.timeout;
          break;
        case DioErrorType.sendTimeout:
          type = NetworkErrorType.network;
          break;
        case DioErrorType.response:
          switch (error.response?.statusCode) {
            case HttpStatus.badRequest: // 400
              type = NetworkErrorType.badRequest;
              break;
            case HttpStatus.unauthorized: // 401
              type = NetworkErrorType.unauthorized;
              break;
            case HttpStatus.forbidden: // 403
              type = NetworkErrorType.forbidden;
              break;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
            case HttpStatus.gatewayTimeout: // 504
              type = NetworkErrorType.server;
              break;
            default:
              type = NetworkErrorType.unknown;
              break;
          }
          break;
        case DioErrorType.cancel:
          type = NetworkErrorType.cancel;
          break;
        default:
          type = NetworkErrorType.unknown;
      }
    } else {
      debugPrint('Network(UnKnown): $error');
      type = NetworkErrorType.unknown;
      message = 'Network: $error';
    }
    return NetworkError(
      error: error,
      message: message,
      type: type,
      stackTrace: stackTrace,
    );
  }
}
