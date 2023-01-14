import 'dart:async';
import 'dart:developer';
import 'package:core_realm/src/realm_transformer.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';

abstract class CoreRealm {
  final String realmPath;

  @protected
  Realm? realm;

  CoreRealm({required this.realmPath}) {
    _openRealm();
  }

  Configuration get config;

  void add(RealmObject object, {bool update = true});

  void addAll(List<RealmObject> objects, {bool update = true});

  T? get<T extends RealmObject>({String? primaryKey});

  List<T> getList<T extends RealmObject>();

  Stream<RealmDataChange<T>>? getStream<T extends RealmObject>();

  void deleteAll<T extends RealmObject>();

  void deleteMany<T extends RealmObject>(List<T> items);

  void delete<T extends RealmObject>({T? object, String? primaryKey});

  void _openRealm() {
    debugPrint("realm path: ${config.path}");
    try {
      realm = Realm(config);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      if (kReleaseMode) {
        Realm.deleteRealm(config.path);
        realm = Realm(config);
      }
    }
  }
}

mixin CoreRealmImpl on CoreRealm {
  @override
  void add(RealmObject object, {bool update = true}) {
    realm?.write(() {
      realm?.add(
        object,
        update: update,
      );
    });
  }

  @override
  void addAll(List<RealmObject> objects, {bool update = true}) {
    realm?.write(() {
      try {
        realm?.addAll(objects, update: update);
      } catch (e) {
        throw Exception(e);
      }
    });
  }

  @override
  T? get<T extends RealmObject>({
    String? primaryKey,
  }) {
    T? result;
    if (primaryKey != null) {
      result = realm?.find<T>(primaryKey);
    } else {
      result = realm?.all<T>().first;
    }
    return result;
  }

  @override
  List<T> getList<T extends RealmObject>() {
    final result = realm?.all<T>();
    final list = result?.toList() ?? [];
    return list;
  }

  @override
  Stream<RealmDataChange<T>>? getStream<T extends RealmObject>() {
    final result = realm?.all<T>();
    final originStream = result?.changes;
    final stream = originStream?.transform(RealmTransformer<T>());
    return stream;
  }

  @override
  void deleteAll<T extends RealmObject>() {
    realm?.write(() {
      realm?.deleteAll<T>();
    });
  }

  @override
  void deleteMany<T extends RealmObject>(List<T> items) {
    realm?.write(() {
      realm?.deleteMany<T>(items);
    });
  }

  @override
  void delete<T extends RealmObject>({T? object, String? primaryKey}) {
    assert(object != null || primaryKey != null);
    realm?.write(() {
      T? itemNeedDelete;
      itemNeedDelete = object ?? get<T>(primaryKey: primaryKey);
      if (itemNeedDelete != null) {
        realm?.delete<T>(itemNeedDelete);
      }
    });
  }
}
