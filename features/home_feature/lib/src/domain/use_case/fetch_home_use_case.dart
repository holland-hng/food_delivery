import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/common/error.dart';
import 'package:core_package/core_package.dart';
import 'package:home_feature/src/domain/model/task.dart';
import 'package:home_feature/src/domain/repository/home_repository.dart';

@singleton
class FetchTasksUseCase {
  final HomeRepository _repository;

  FetchTasksUseCase(this._repository);

  Future<Result<List<Task>, AppError>> execute() async {
    try {
      final tasks = await _repository.fetchTasks();
      final result = tasks.map((dto) => Task.fromTaskDto(dto)).toList();
      return Success(result);
    } catch (e, s) {
      return Error(NetworkError.fromError(e, s));
    }
  }
}
