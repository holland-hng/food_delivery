import 'package:core_dependency/core_dependency.dart';

abstract class BannerController {}

@Injectable(as: BannerController)
class BannerControllerImpl extends BannerController {}
