import 'package:core_dependency/core_dependency.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies({GetIt? mainGetIt}) async {
  final internalGetIt = mainGetIt ?? getIt;
  await $initGetIt(internalGetIt);
}
