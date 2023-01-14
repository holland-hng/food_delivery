import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:flutter/foundation.dart';
import 'package:home_feature/src/data/home/model/task_dto.dart';
part 'rest_client.g.dart';

@RestApi(
  parser: Parser.FlutterCompute,
  baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/",
)
@singleton
abstract class TaskRestClient {
  @factoryMethod
  factory TaskRestClient(Dio dio) = _TaskRestClient;
  @GET("/tasks")
  Future<List<TaskDto>> fetchTasks();
}
