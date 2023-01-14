import 'dart:math';

import 'package:core_dependency/core_dependency.dart';
import 'package:home_feature/src/domain/model/task.dart';
import 'package:home_feature/src/domain/use_case/add_task_use_case.dart';
import 'package:home_feature/src/domain/use_case/cache_homes_use_case.dart';
import 'package:home_feature/src/domain/use_case/fetch_home_use_case.dart';
import 'package:home_feature/src/domain/use_case/get_homes_cached_use_case.dart';

abstract class HomeController {
  RxList<Task> get rxTasks;
  Rx<HomeStateUI> get rxState;

  void addNewTask();
}

enum HomeStateUI {
  idle,
  loading,
  loaded,
  error,
}

@Injectable(as: HomeController)
class HomeControllerImpl extends HomeController {
  final CacheTasksUseCase cacheTasks;
  final FetchTasksUseCase fetchTasks;
  final GetTasksCachedUseCase getTasksCached;
  final AddTasksUseCase addTask;

  @override
  final RxList<Task> rxTasks = RxList();
  @override
  final Rx<HomeStateUI> rxState = Rx(HomeStateUI.idle);

  HomeControllerImpl(
      this.cacheTasks, this.fetchTasks, this.getTasksCached, this.addTask) {
    initTesting();
  }

  Future<void> initTesting() async {
    rxState.value = HomeStateUI.loading;
    getTasksCached.execute();
    final result = await fetchTasks.execute();

    result.when(
      (tasks) async {
        rxTasks.value = tasks;
        cacheTasks.execute(tasks);
        rxState.value = HomeStateUI.loaded;
      },
      (error) {
        debugPrint(error.toString());
        rxState.value = HomeStateUI.error;
      },
    );
  }

  @override
  void addNewTask() {
    var intValue = Random().nextInt(100);

    final task = rxTasks[intValue];
    addTask.execute(task);
  }
}
