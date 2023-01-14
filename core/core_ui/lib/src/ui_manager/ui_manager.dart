import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:core_ui/src/localization/locale_type.dart';
import 'package:core_ui/src/theme/app_theme.dart';
import 'package:core_ui/src/theme/dark_theme.dart';
import 'package:core_ui/src/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIConfigtion {
  final Brightness brightness;
  final LocaleType localeType;

  UIConfigtion({
    required this.brightness,
    required this.localeType,
  });

  static const localeKey = 'locale_cache_key';
  static const themeKey = AdaptiveTheme.prefKey;
  static const modeKey = 'theme_mode';

  static Future<UIConfigtion> getInstance() async {
    Brightness brightness;
    LocaleType localeType;
    final prefs = await SharedPreferences.getInstance();
    try {
      final themeDataString = prefs.getString(UIConfigtion.themeKey);
      final themeDataMap = json.decode(themeDataString!);
      final themeMode = AdaptiveThemeMode.values[themeDataMap[modeKey]];
      brightness = themeMode.brightness!;
    } catch (e) {
      brightness = SchedulerBinding.instance.window.platformBrightness;
    }

    try {
      final localeDataString = prefs.getString(UIConfigtion.localeKey);
      localeType = localeDataString!.locale;
    } catch (e) {
      localeType = LocaleType.english;
    }
    return UIConfigtion(
      brightness: brightness,
      localeType: localeType,
    );
  }
}

abstract class UIBehavior {
  void changeLocale(LocaleType localeType);
  void setLight();
  void setDark();
  void toggleThemeMode();
  @protected
  AdaptiveThemeManager<ThemeData>? _adaptiveManager;
}

class UIManager extends StatefulWidget {
  final UIConfigtion configtion;
  final Widget Function(ThemeData, ThemeData, Locale) builder;
  const UIManager({
    super.key,
    required this.builder,
    required this.configtion,
  });

  @override
  State<UIManager> createState() => _UIManagerState();

  static UIBehavior of(BuildContext context) {
    final state = context.findAncestorStateOfType<State<UIManager>>();
    final behavior = state as UIBehavior;
    if (behavior._adaptiveManager == null) {
      final adaptiveManager =
          context.findAncestorStateOfType<State<AdaptiveTheme>>()!
              as AdaptiveThemeManager<ThemeData>;
      behavior._adaptiveManager = adaptiveManager;
    }
    return behavior;
  }

  static AppTheme themeOf(BuildContext context) {
    final adaptiveManager =
        context.findAncestorStateOfType<State<AdaptiveTheme>>()!
            as AdaptiveThemeManager<ThemeData>;
    final appTheme = adaptiveManager.brightness!.appTheme;
    return appTheme;
  }
}

class _UIManagerState extends State<UIManager> implements UIBehavior {
  late Locale currentLocale;
  late Widget Function(ThemeData, ThemeData) adaptiveBuilder;

  @override
  void initState() {
    currentLocale = widget.configtion.localeType.locale;
    adaptiveBuilder = (p0, p1) {
      return widget.builder(p0, p1, currentLocale);
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: widget.configtion.brightness.adaptiveThemeMode,
      builder: adaptiveBuilder,
    );
  }

  @override
  void changeLocale(LocaleType localeType) {
    setState(() {
      currentLocale = localeType.locale;
    });
  }

  @override
  void setDark() {
    _adaptiveManager?.setDark();
  }

  @override
  void setLight() {
    _adaptiveManager?.setLight();
  }

  @override
  void toggleThemeMode() {
    if (_adaptiveManager?.brightness == Brightness.light) {
      setDark();
    } else {
      setLight();
    }
  }

  @override
  AdaptiveThemeManager<ThemeData>? _adaptiveManager;
}

extension BrightnessExtension on Brightness {
  AppTheme get appTheme {
    switch (this) {
      case Brightness.light:
        return LightTheme.instance;
      case Brightness.dark:
        return DarkTheme.instance;
      default:
        throw UnimplementedError();
    }
  }

  AdaptiveThemeMode get adaptiveThemeMode {
    switch (this) {
      case Brightness.light:
        return AdaptiveThemeMode.light;
      case Brightness.dark:
        return AdaptiveThemeMode.dark;
      default:
        throw UnimplementedError();
    }
  }
}

extension AppThemeContext on BuildContext {
  AppTheme get appTheme {
    return UIManager.themeOf(this);
  }

  UIBehavior get uiBehavior {
    return UIManager.of(this);
  }
}

extension on AdaptiveThemeMode {
  Brightness? get brightness {
    switch (this) {
      case AdaptiveThemeMode.light:
        return Brightness.light;
      case AdaptiveThemeMode.dark:
        return Brightness.dark;
      default:
        return null;
    }
  }
}
