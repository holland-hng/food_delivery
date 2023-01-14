import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AppDirectory {
  final Directory dir;

  AppDirectory._(this.dir);

  static Future<AppDirectory> getInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    return AppDirectory._(dir);
  }

  String get homeFeature => _composePath(FeaturePath.home);
  String get profileFeature => _composePath(FeaturePath.profile);

  String _composePath(FeaturePath feature) {
    return "${dir.path}${feature.path}";
  }
}

enum FeaturePath {
  home,
  profile,
}

extension FeaturePathExtension on FeaturePath {
  String get path {
    switch (this) {
      case FeaturePath.home:
        return "/database/home.realm";
      case FeaturePath.profile:
        return "/database/profile.realm";
      default:
        throw UnimplementedError();
    }
  }
}
