import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/src/auth/domain/model/auth.dart';
import 'package:core_package/src/auth/domain/repository/auth_repository.dart';

@singleton
class GetAuthUseCase {
  final AuthRepository _repository;

  GetAuthUseCase(this._repository);

  Result<Auth, AppError> execute() {
    try {
      final authDao = _repository.getAuth();
      final auth = Auth.fromAdo(authDao);
      return Success(auth);
    } catch (e, s) {
      return Error(
        AppError(
          error: e,
          stackTrace: s,
          type: CacheErrorType.getCacheFail,
        ),
      );
    }
  }
}
