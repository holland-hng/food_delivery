import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

@module
abstract class DIOModule {
  @lazySingleton
  Dio dio({bool enableLog = false}) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 6000,
        receiveTimeout: 6000,
        contentType: 'application/json',
        receiveDataWhenStatusError: true,
      ),
    );

    if (enableLog) {
      final prettyDioLogger = PrettyDioLogger(
        requestHeader: false,
        queryParameters: false,
        requestBody: false,
        responseHeader: false,
        responseBody: true,
        error: true,
        showProcessingTime: true,
        showCUrl: true,
        canShowLog: kDebugMode,
      );
      dio.interceptors.add(prettyDioLogger);
    }
    final retryInterceptor = RetryInterceptor(
      dio: dio,
      retries: 3,
      retryDelays: const [Duration.zero],
    );
    dio.interceptors.add(retryInterceptor);
    return dio;
  }
}
