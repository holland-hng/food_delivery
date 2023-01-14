import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/src/auth/domain/repository/auth_repository.dart';

enum AuthState {
  valid,
  inValid,
}

@singleton
class CheckAuthUseCase {
  final AuthRepository _repository;

  CheckAuthUseCase(this._repository);
  AuthState execute() {
    AuthState result;
    try {
      final _ = _repository.getAuth();
      result = AuthState.valid;
    } catch (e) {
      result = AuthState.inValid;
    }
    return result;
  }
}
