import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../core_realm.dart';

class RealmDataChange<T> {
  final List<T> all;
  final Map<int, T> modified;
  final Map<int, T> deleted;
  final Map<int, T> inserted;
  final Map<int, T> newModified;

  RealmDataChange({
    required this.all,
    required this.modified,
    required this.deleted,
    required this.inserted,
    required this.newModified,
  });
}

class RealmSink<T> implements EventSink<RealmResultsChanges<T>> {
  final EventSink<RealmDataChange<T>> _outputSink;
  RealmSink(this._outputSink);

  @override
  void add(RealmResultsChanges<T> event) {
    final listCached = event.results.toList();
    final realmDataChange = RealmDataChange(
      all: listCached,
      deleted: getMapDataFlowIndexes(event.deleted, listCached),
      inserted: getMapDataFlowIndexes(event.inserted, listCached),
      modified: getMapDataFlowIndexes(event.modified, listCached),
      newModified: getMapDataFlowIndexes(event.newModified, listCached),
    );
    _outputSink.add(realmDataChange);
  }

  @override
  void addError(e, [st]) {
    _outputSink.addError(e, st);
  }

  @override
  void close() {
    _outputSink.close();
  }

  Map<int, T> getMapDataFlowIndexes(List<int> indexes, List<T> data) {
    Map<int, T> result = {};
    for (var index in indexes) {
      try {
        result[index] = data[index];
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return result;
  }
}

class RealmTransformer<T>
    extends StreamTransformerBase<RealmResultsChanges<T>, RealmDataChange<T>> {
  @override
  Stream<RealmDataChange<T>> bind(Stream<RealmResultsChanges<T>> stream) =>
      Stream<RealmDataChange<T>>.eventTransformed(
        stream,
        (EventSink<RealmDataChange<T>> sink) => RealmSink<T>(
          sink,
        ),
      );
}
