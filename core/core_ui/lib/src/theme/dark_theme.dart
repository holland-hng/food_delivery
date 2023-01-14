import 'package:flutter/material.dart';
import 'app_theme.dart';

class DarkTheme extends AppTheme {
  static final DarkTheme instance = DarkTheme._internal();

  DarkTheme._internal();

  @override
  final Color textPrimary = Colors.green;
}
