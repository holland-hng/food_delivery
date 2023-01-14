import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/home_feature.dart';

@singleton
class HomeFeature {
  final Widget root = const HomeScreen();

  HomeFeature();
}
