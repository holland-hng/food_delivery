import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/home_feature.dart';
import 'package:core_router/core_router.dart';
part 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen),
    AutoRoute(page: BannerScreen),
  ],
)
class HomeFeatureRouter extends _$HomeFeatureRouter {}
