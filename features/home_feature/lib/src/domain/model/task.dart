import 'package:home_feature/src/data/home/model/task_dto.dart';
import 'package:home_feature/src/data/home/model/task_dao.dart';

class Task {
  final String id;
  final String name;
  final String avatar;
  final String createdAt;

  Task({
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  factory Task.fromTaskDao(TaskDao taskDao) {
    return Task(
      id: taskDao.id ?? "",
      name: taskDao.name ?? "",
      avatar: taskDao.avatar ?? "",
      createdAt: taskDao.createdAt ?? "",
    );
  }

  factory Task.fromTaskDto(TaskDto taskDao) {
    return Task(
      id: taskDao.id ?? "",
      name: taskDao.name ?? "",
      avatar: taskDao.avatar ?? "",
      createdAt: taskDao.createdAt ?? "",
    );
  }
}
