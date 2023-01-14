import 'package:core_realm/core_realm.dart';

import '/src/data/home/model/task_dto.dart';
import '/src/data/home/model/task_dao.dart';

abstract class HomeRepository {
  Future<List<TaskDto>> fetchTasks();

  Future<List<TaskDao>> getTasksCached();

  void cacheTasks(List<TaskDao> tasks);

  Stream<RealmDataChange<TaskDao>>? getStream();

  void addTask(TaskDao task);
}
