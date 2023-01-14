import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/auth/domain/use_case/auth_use_case.dart';

import '../domain/model/auth.dart';

@singleton
class AuthController {
  final AuthUseCase authUserCase;

  AuthController(this.authUserCase) {
    testing();
  }

  void testing() {
    authUserCase.cacheAuth.execute(
      Auth(
        token: "token",
        refreshToken: "refreshToken",
      ),
    );
    final result = authUserCase.getAuth.execute();
    result.when((auth) {
      debugPrint(auth.token);
      debugPrint(auth.refreshToken);
    }, (error) {
      debugPrint(error.message);
    });
  }
}
