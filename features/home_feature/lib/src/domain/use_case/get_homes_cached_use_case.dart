import 'dart:async';

import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/cache_error.dart';
import 'package:core_package/common/error.dart';
import 'package:core_realm/core_realm.dart';
import 'package:home_feature/src/domain/model/task.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';

import '../../data/home/model/task_dao.dart';

@singleton
class GetTasksCachedUseCase {
  final HomeRepository _repository;

  GetTasksCachedUseCase(this._repository);
  StreamSubscription<RealmDataChange<TaskDao>>? sub;
  Future<Result<List<Task>, AppError>> execute() async {
    try {
      final homes = await _repository.getTasksCached();
      final result = homes.map((taskDao) => Task.fromTaskDao(taskDao)).toList();
      return Success(result);
    } catch (e, s) {
      return Error(
        CacheError(
          error: e,
          type: CacheErrorType.getCacheFail,
          stackTrace: s,
        ),
      );
    }
  }
}
