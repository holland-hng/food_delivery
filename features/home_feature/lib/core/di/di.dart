import 'package:core_package/core_package.dart' as core_package;
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:home_feature/core/router/router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies({GetIt? mainGetIt}) async {
  final isRunFromModule = mainGetIt == null;
  final internalGetIt = mainGetIt ?? getIt;
  if (isRunFromModule) {
    List<Future> listConfig = [
      core_package.configureDependencies(mainGetIt: internalGetIt),
    ];
    await Future.wait(listConfig);
    registerAppRouter(internalGetIt);
  }

  $initGetIt(internalGetIt);
}

void registerAppRouter(GetIt internalGetIt) {
  final homeFeatureRouter = HomeFeatureRouter();
  final appRouter = AppRouter(homeFeatureRouter);
  internalGetIt.registerLazySingleton<AppRouter>(() => appRouter);
}
