import 'package:realm/realm.dart';

part 'task_dao.g.dart';

@RealmModel()
class _TaskDao {
  @PrimaryKey()
  String? id;
  String? name;
  String? avatar;
  String? createdAt;
}
