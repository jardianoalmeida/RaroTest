import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@singleton
class HiveClient {
  final initialized = Completer<bool>();

  HiveClient() {
    _init();
  }

  _init() async {
    if (Platform.isAndroid || Platform.isIOS)
      Hive.init((await getApplicationDocumentsDirectory()).path);
    initialized.complete(true);
  }

  Future<Box> getBox(String box) async {
    if (await initialized.future) {
      return Hive.openBox(box);
    } else {
      throw "Hive not initialized";
    }
  }

  Future<void> delete(String box, String key) async {
    final _box = await getBox(box);
    return _box.delete(key);
  }

  Future<T> get<T>(String box, String key) async {
    final _box = await getBox(box);
    return _box.get(key);
  }

  Future<List> getAll(String box) async {
    final _box = await getBox(box);
    return _box.values.toList();
  }

  Future<void> put<T>(String box, String key, T value) async {
    final _box = await getBox(box);
    return _box.put(key, value);
  }

  Future<int> add(String box, value) async {
    final _box = await getBox(box);
    return _box.add(value);
  }

  Stream<BoxEvent> watch({required String? box, String? key}) async* {
    final _box = await getBox(box!);
    yield* _box.watch(key: key).asyncMap((event) => event);
  }
}
