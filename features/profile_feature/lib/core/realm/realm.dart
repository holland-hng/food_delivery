import 'package:core_dependency/core_dependency.dart';
import 'package:core_package/core_package.dart';
import 'package:core_realm/core_realm.dart';
import '/src/data/shipping_address/model/shipping_address_dao.dart';

@singleton
class ProfileFeatureRealm extends CoreRealm with CoreRealmImpl {
  ProfileFeatureRealm(AppDirectory appDir)
      : super(
          realmPath: appDir.profileFeature,
        );

  @override
  Configuration get config => Configuration.local(
        [
          ShippingAddressDao.schema,
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
