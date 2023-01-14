import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/auth/domain/use_case/check_auth_use_case.dart';
import 'package:core_package/src/auth/domain/use_case/get_auth_use_case.dart';

import 'cache_auth_use_case.dart';

@singleton
class AuthUseCase {
  final CacheAuthUserCase cacheAuth;
  final CheckAuthUseCase checkAuth;
  final GetAuthUseCase getAuth;

  AuthUseCase({
    required this.cacheAuth,
    required this.checkAuth,
    required this.getAuth,
  });
}
