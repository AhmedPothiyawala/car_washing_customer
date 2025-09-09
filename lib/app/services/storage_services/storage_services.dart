import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/global_constant.dart';

class StorageService extends GetxService {
  static late SharedPreferences _sharedPreferences;
  @override
  void onInit() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    super.onInit();
  }

  void writeString({required String key, required String value}) async {
    try {
      appLogger.d('$key storage called');
      await _sharedPreferences.setString(key, value);
    } catch (e) {
      appLogger.e(e.toString(), error: e);
    }
  }

  void writeBool({required String key, required bool value}) async {
    try {
      appLogger.d('$key storage called');
      await _sharedPreferences.setBool(key, value);
    } catch (e) {
      appLogger.e(e.toString(), error: e);
    }
  }

  Future<String?> readString(String key) async {
    try {
      String? str = _sharedPreferences.getString(key);
      if (str != null) {
        return str;
      } else {
        return null;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      return e.toString();
    }
  }

  Future<bool?> readBool(String key) async {
    try {
      bool? value = _sharedPreferences.getBool(key);
      if (value != null) {
        return value;
      } else {
        return null;
      }
    } catch (e) {
      appLogger.e(e.toString(), error: e);
      return false;
    }
  }

  Future<bool> containsKey(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(key);
  }

  Future<void> removeFromStorageKeys({required List<String> listKey}) async {
    for (var action in listKey) {
      await _sharedPreferences.remove(action);
    }
  }

  Future<void> clearStorage() async {
    await _sharedPreferences.clear();
  }
}
