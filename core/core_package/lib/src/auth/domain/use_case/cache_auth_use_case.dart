import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/src/auth/domain/model/auth.dart';
import 'package:core_package/src/auth/domain/repository/auth_repository.dart';

@singleton
class CacheAuthUserCase {
  final AuthRepository repository;

  CacheAuthUserCase(this.repository);
  Result<bool, AppError> execute(Auth auth) {
    try {
      final authDao = auth.toDao();
      repository.cacheAuth(authDao);
      return const Success(true);
    } catch (e, s) {
      return Error(
        CacheError(
          error: e,
          stackTrace: s,
          type: CacheErrorType.cacheFail,
        ),
      );
    }
  }
}
