import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:home_feature/core/bridge/home_feature.dart';
import 'package:profile_feature/core/bridge/profile_feature.dart';

abstract class ControllerHub {
  HomeFeature get homeFeature;
  ProfileFeature get profileFeature;
}

@Singleton(as: ControllerHub)
class ControllerHubImpl extends ControllerHub {
  final AppRouter appRouter;
  final EventBus eventBus;

  @override
  final HomeFeature homeFeature;

  @override
  final ProfileFeature profileFeature;

  ControllerHubImpl(
    this.appRouter,
    this.eventBus,
    this.homeFeature,
    this.profileFeature,
  );
}
