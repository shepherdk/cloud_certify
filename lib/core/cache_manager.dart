import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CacheManager {
  Future<bool> save(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final success = await _prefs.setString(key, value);
    return success;
  }

  Future<String?> read(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  Future<bool> delete(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final success = await _prefs.remove(key);
    return success;
  }
}
