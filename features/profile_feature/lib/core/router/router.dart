import 'package:core_dependency/core_dependency.dart';
import 'package:profile_feature/profile_feature.dart';
import 'package:core_router/core_router.dart';
import 'package:profile_feature/src/presentation/screens/shipping_address/shipping_address.dart';
part 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ProfileScreen),
    AutoRoute(
      path: '/shipping_address/:id/detail',
      page: ShippingAddressScreen,
    ),
  ],
)
class ProfileFeatureRouter extends _$ProfileFeatureRouter {}
