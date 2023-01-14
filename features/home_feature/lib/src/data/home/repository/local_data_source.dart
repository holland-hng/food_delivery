import 'package:core_dependency/core_dependency.dart';
import 'package:core_realm/core_realm.dart';
import 'package:home_feature/core/realm/realm.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';

@singleton
class HomeLocalDataSource {
  final HomeFeatureRealm _realm;

  HomeLocalDataSource(this._realm);

  List<TaskDao> getTasksCached() {
    final tasks = _realm.getList<TaskDao>();
    return tasks;
  }

  void cacheTasks(List<TaskDao> tasks) {
    _realm.addAll(tasks);
  }

  Stream<RealmDataChange<TaskDao>>? getTaskChangeStream() {
    return _realm.getStream<TaskDao>();
  }

  void addTask(TaskDao taskDao) {
    _realm.delete<TaskDao>(primaryKey: taskDao.id);
    _realm.add(taskDao);
  }
}
