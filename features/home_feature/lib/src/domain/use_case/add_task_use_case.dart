import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';
import 'package:home_feature/src/domain/model/task.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';

@singleton
class AddTasksUseCase {
  final HomeRepository _repository;

  AddTasksUseCase(this._repository);
  Result<bool, AppError> execute(Task e) {
    try {
      final tasksDao = TaskDao(
        e.id,
        avatar: e.avatar,
        createdAt: e.createdAt,
        name: e.name,
      );
      _repository.addTask(tasksDao);
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
