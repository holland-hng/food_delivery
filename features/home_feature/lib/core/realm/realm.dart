import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:core_realm/core_realm.dart';
import '/src/data/home/model/task_dao.dart';

@singleton
class HomeFeatureRealm extends CoreRealm with CoreRealmImpl {
  HomeFeatureRealm(AppDirectory appDir)
      : super(
          realmPath: appDir.homeFeature,
        );
  @override
  Configuration get config => Configuration.local(
        [
          TaskDao.schema,
        ],
        path: realmPath,
        initialDataCallback: (realm) {
          debugPrint("initialDataCallback: ${realm.toString()}");
        },
        migrationCallback: (migration, oldSchemaVersion) {
          final realm = migration.newRealm;
          debugPrint("migrationCallback: ${realm.toString()}");
          //do something
        },
        schemaVersion: 0,
      );
}
