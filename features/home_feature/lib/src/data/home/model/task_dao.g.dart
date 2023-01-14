// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dao.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TaskDao extends _TaskDao with RealmEntity, RealmObjectBase, RealmObject {
  TaskDao(
    String? id, {
    String? name,
    String? avatar,
    String? createdAt,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'avatar', avatar);
    RealmObjectBase.set(this, 'createdAt', createdAt);
  }

  TaskDao._();

  @override
  String? get id => RealmObjectBase.get<String>(this, 'id') as String?;
  @override
  set id(String? value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get avatar => RealmObjectBase.get<String>(this, 'avatar') as String?;
  @override
  set avatar(String? value) => RealmObjectBase.set(this, 'avatar', value);

  @override
  String? get createdAt =>
      RealmObjectBase.get<String>(this, 'createdAt') as String?;
  @override
  set createdAt(String? value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  Stream<RealmObjectChanges<TaskDao>> get changes =>
      RealmObjectBase.getChanges<TaskDao>(this);

  @override
  TaskDao freeze() => RealmObjectBase.freezeObject<TaskDao>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TaskDao._);
    return const SchemaObject(ObjectType.realmObject, TaskDao, 'TaskDao', [
      SchemaProperty('id', RealmPropertyType.string,
          optional: true, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('avatar', RealmPropertyType.string, optional: true),
      SchemaProperty('createdAt', RealmPropertyType.string, optional: true),
    ]);
  }
}
