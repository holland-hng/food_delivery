import 'package:core_package/src/auth/data/model/auth_dao.dart';

abstract class AuthRepository {
  AuthDao getAuth();
  void cacheAuth(AuthDao auth);
}
