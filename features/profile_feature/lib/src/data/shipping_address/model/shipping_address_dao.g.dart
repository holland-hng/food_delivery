// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_dao.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ShippingAddressDao extends _ShippingAddressDao
    with RealmEntity, RealmObjectBase, RealmObject {
  ShippingAddressDao(
    String? id, {
    String? address,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'address', address);
  }

  ShippingAddressDao._();

  @override
  String? get id => RealmObjectBase.get<String>(this, 'id') as String?;
  @override
  set id(String? value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get address =>
      RealmObjectBase.get<String>(this, 'address') as String?;
  @override
  set address(String? value) => RealmObjectBase.set(this, 'address', value);

  @override
  Stream<RealmObjectChanges<ShippingAddressDao>> get changes =>
      RealmObjectBase.getChanges<ShippingAddressDao>(this);

  @override
  ShippingAddressDao freeze() =>
      RealmObjectBase.freezeObject<ShippingAddressDao>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ShippingAddressDao._);
    return const SchemaObject(
        ObjectType.realmObject, ShippingAddressDao, 'ShippingAddressDao', [
      SchemaProperty('id', RealmPropertyType.string,
          optional: true, primaryKey: true),
      SchemaProperty('address', RealmPropertyType.string, optional: true),
    ]);
  }
}
