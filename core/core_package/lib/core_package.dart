library core_package;

//di
export 'di/di.dart' show configureDependencies;

//common
export 'common/network_error.dart';
export 'common/logger.dart';
export 'src/app_directory/app_directory.dart';

//third party
export 'package:json_annotation/json_annotation.dart';
export 'package:path_provider/path_provider.dart';
export 'package:retrofit/retrofit.dart';
export 'package:dio/dio.dart' hide Headers, ProgressCallback;
export 'package:shared_preferences/shared_preferences.dart';
