import 'package:core_package/src/app_manager/app_env.dart';
import 'package:flutter/material.dart';

class AppManager {
  final Widget child;
  final AppEnv env;

  AppManager({
    required this.child,
    required this.env,
  });
}
