import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/auth/data/model/auth_dao.dart';

@singleton
class AuthLocalDataSource {
  AuthLocalDataSource();

  void cacheAuth(AuthDao auth) {}

  AuthDao getAuth() {
    return AuthDao(token: "token", refreshToken: "refreshToken");
  }
}
