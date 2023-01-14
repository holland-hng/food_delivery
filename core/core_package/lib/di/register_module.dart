import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/app_directory/app_directory.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<AppDirectory> get appDirectory => AppDirectory.getInstance();

  @lazySingleton
  EventBus get eventBus => EventBus();
}
