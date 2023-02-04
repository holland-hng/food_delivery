import 'package:core_package/core_package.dart';
import 'package:core_package/di/dio_module.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:profile_feature/core/realm/realm.dart';

import 'common.mocks.dart';

@GenerateMocks([
  ProfileFeatureRealm,
])
class $DIOModule extends DIOModule {}

final Dio dio = $DIOModule().dio(enableLog: true);

final DioAdapter dioAdapter = DioAdapter(
  dio: dio,
  matcher: const UrlRequestMatcher(),
);

final ProfileFeatureRealm realm = MockProfileFeatureRealm();
