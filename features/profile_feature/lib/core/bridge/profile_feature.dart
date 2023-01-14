import 'package:core_dependency/core_dependency.dart';
import 'package:profile_feature/profile_feature.dart';

@singleton
class ProfileFeature {
  final Widget root = const ProfileScreen();

  ProfileFeature();
}
