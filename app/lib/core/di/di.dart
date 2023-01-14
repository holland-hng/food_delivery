import 'di.config.dart';
import 'package:app/core/router/router.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:home_feature/home_feature.dart' as home_feature;
import 'package:profile_feature/profile_feature.dart' as profile_feature;
// ignore: depend_on_referenced_packages
import 'package:core_package/core_package.dart' as core_package;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  registerAppRouter(getIt);
  await core_package.configureDependencies(di: getIt);
  List<Future> listConfig = [
    home_feature.configureDependencies(di: getIt),
    profile_feature.configureDependencies(di: getIt),
  ];

  await Future.wait(listConfig);
  $initGetIt(getIt);
}

void registerAppRouter(GetIt getIt) {
  final mainAppRouter = MainAppRouter();
  final appRouter = AppRouter(mainAppRouter);
  getIt.registerLazySingleton<AppRouter>(() => appRouter);
}
