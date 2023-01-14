import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/src/data/home/model/task_dto.dart';

import 'rest_client.dart';

@singleton
class HomeRemoteDataSource {
  final TaskRestClient _restClient;

  HomeRemoteDataSource(this._restClient);

  Future<List<TaskDto>> fetchTasks() {
    return _restClient.fetchTasks();
  }
}
