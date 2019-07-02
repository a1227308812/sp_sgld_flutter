library localstorage;

export 'LocalStorageKey.dart';

import 'package:shared_preferences/shared_preferences.dart';

/**
 * Created by ZWP on 2019/7/1 15:21.
 * 描述：SharedPreferences 本地存储
 */
class LocalStorage {
  static saveString(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static saveBool(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
