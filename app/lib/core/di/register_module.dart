import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_package/core_package.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<UIConfiguration> uiConfiguration(SharedPreferences prefs) {
    return UIConfiguration.getInstance(prefs: prefs);
  }
}
