import 'package:core_realm/core_realm.dart';
part 'shipping_address_dao.g.dart';

@RealmModel()
class _ShippingAddressDao {
  @PrimaryKey()
  String? id;
  String? address;
}
