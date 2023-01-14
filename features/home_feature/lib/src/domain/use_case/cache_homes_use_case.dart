import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';
import 'package:home_feature/src/domain/model/task.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';

@singleton
class CacheTasksUseCase {
  final HomeRepository _repository;

  CacheTasksUseCase(this._repository);
  Result<bool, AppError> execute(List<Task> homes) {
    try {
      final tasksDao = homes
          .map((e) => TaskDao(
                e.id,
                avatar: e.avatar,
                createdAt: e.createdAt,
                name: e.name,
              ))
          .toList();
      _repository.cacheTasks(tasksDao);
      return const Success(true);
    } catch (e, s) {
      return Error(
        CacheError(
          error: e,
          type: CacheErrorType.cacheFail,
          stackTrace: s,
        ),
      );
    }
  }
}
