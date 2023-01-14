import 'package:app/core/router/router.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final appRouter = getIt<AppRouter>();
  final uiConfiguration = getIt<UIConfiguration>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UIManager(
      builder: (light, dark, locale) {
        return MaterialApp.router(
          title: 'Food delivery',
          locale: locale,
          theme: light,
          darkTheme: dark,
          routeInformationParser: appRouter.router.defaultRouteParser(),
          routerDelegate: appRouter.router.delegate(
            initialRoutes: [const TabBarScreenRoute()],
          ),
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalWidgetsLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          supportedLocales: localizedLabels.keys.toList(),
        );
      },
      configuration: uiConfiguration,
    );
  }
}
