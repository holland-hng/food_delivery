import 'package:app/src/presentation/tab_bar/tab_bar_screen.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:home_feature/core/router/router.dart';
import 'package:profile_feature/core/router/router.dart';

part 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route,App',
  routes: <AutoRoute>[
    AutoRoute(
      page: TabBarScreen,
    ),
  ],
)
class MainAppRouter extends _$MainAppRouter {
  MainAppRouter() {
    final homeRouter = HomeFeatureRouter();
    final profileRouter = ProfileFeatureRouter();

    pagesMap.addAll(homeRouter.pagesMap);
    pagesMap.addAll(profileRouter.pagesMap);

    routes = super.routes;
    routes.addAll(homeRouter.routes);
    routes.addAll(profileRouter.routes);
  }

  @override
  List<RouteConfig> routes = [];
}
