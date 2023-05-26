import 'package:hive_flutter/hive_flutter.dart';

///Wrapper for [Hive] package.
///Provides access for reading and writing values to device local storage
abstract class LocalStorage {
  //boxes
  static const String kSettings = 'settings';
  static const String kCache = 'cache';

  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox<dynamic>(kSettings);
    await Hive.openLazyBox<dynamic>(kCache);
  }

  static dynamic readSettingValue(String key, dynamic defaultValue) =>
      Hive.box<dynamic>(kSettings).get(key, defaultValue: defaultValue);

  static Future<void> writeSettingValue(String key, dynamic value) =>
      Hive.box<dynamic>(kSettings).put(key, value);

  static Future<dynamic> getData(String key) =>
      Hive.lazyBox<dynamic>(kCache).get(key);

  static Future<void> writeData(String key, dynamic value) =>
      Hive.lazyBox<dynamic>(kCache).put(key, value);

  static Future<void> removeData(String key) async {
    return Hive.lazyBox<dynamic>(kCache).delete(key);
  }

  static void dispose() => Hive.close();
}
