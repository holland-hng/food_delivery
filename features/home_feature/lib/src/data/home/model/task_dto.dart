import 'dart:async';
import 'package:core_package/core_package.dart';
part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  TaskDto({this.id, this.name, this.avatar, this.createdAt});

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}

FutureOr<List<TaskDto>> deserializeTaskDtoList(
        List<Map<String, dynamic>> json) =>
    json.map((e) => TaskDto.fromJson(e)).toList();
