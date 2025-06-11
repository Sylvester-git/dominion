import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class Storage {
  Future<void> saveUserID({required String userID});
  Future<String> getUserID();
  Future<void> clearData();
  Future<void> initHive();
}

//! Boxs
final String userBox = 'userBox';

//! Keys
final String userIDKey = 'userID';

class StorageImpl implements Storage {
  @override
  Future<String> getUserID() async {
    final openBox = await Hive.openBox(userBox);
    final value = await openBox.get(userIDKey, defaultValue: '') as String;
    await openBox.close();
    return value;
  }

  @override
  Future<void> saveUserID({required String userID}) async {
    final openBox = await Hive.openBox(userBox);
    await openBox.put(userIDKey, userID);
    await openBox.close();
  }

  @override
  Future<void> clearData() async {
    await Future.wait([Hive.deleteBoxFromDisk(userBox)]);
  }

  @override
  Future<void> initHive() async {
    if (kIsWeb) return;
    final appDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDirectory.path);
  }
}
