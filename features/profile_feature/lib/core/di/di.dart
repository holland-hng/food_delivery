import 'package:core_package/core_package.dart' as core_package;
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:profile_feature/core/router/router.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies({GetIt? di}) async {
  final isFromMainApp = di != null;
  final internalGetIt = di ?? getIt;
  if (isFromMainApp) {
    //do nothing
  } else {
    List<Future> listConfig = [
      core_package.configureDependencies(di: internalGetIt),
    ];
    await Future.wait(listConfig);
    registerAppRouter(internalGetIt);
  }

  $initGetIt(internalGetIt);
}

void registerAppRouter(GetIt internalGetIt) {
  final profileFeatureRouter = ProfileFeatureRouter();
  final appRouter = AppRouter(profileFeatureRouter);
  internalGetIt.registerLazySingleton<AppRouter>(() => appRouter);
}
