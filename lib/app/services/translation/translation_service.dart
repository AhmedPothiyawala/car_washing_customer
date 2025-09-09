import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/global_constant.dart';

class TranslationService extends GetxService {
  late SharedPreferences _sharedPreferences;

  final RxString _langCode = "en_US".obs;

  RxString get langCode => _langCode;

  @override
  void onInit() async {
    await initLocaleServices();
    Get.updateLocale(Locale(langCode.value));

    super.onInit();
  }

  Future<void> initLocaleServices() async {
    appLogger.d("initLocaleServices called");
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isLocaleContains = _sharedPreferences.containsKey('lang');
    if (isLocaleContains) {
      ///get locale from prefs
      String storageCode = await getLocaleFromStorage();
      Get.updateLocale(Locale(storageCode));

      await setLocaleToStorage(code: storageCode)
          .then((_) => _langCode.value = storageCode);
      // notifyListeners();
    } else {
      ///if pref don't have any locale the set to en_US
      Get.updateLocale(const Locale("en_US"));
      await setLocaleToStorage(code: "en_US")
          .then((_) => _langCode.value = "en_US");
      // notifyListeners();
    }
  }

  Future<void> changeLocale(
      {required String languageCode, required BuildContext context}) async {
    _langCode.value = languageCode;
    await setLocaleToStorage(code: languageCode);
    Get.updateLocale(Locale(languageCode));
    // notifyListeners();
  }

  Future<void> setLocaleToStorage({required String code}) async {
    _langCode.value = code;
    _sharedPreferences.setString('lang', code);
    // notifyListeners();
  }

  Future<String> getLocaleFromStorage() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    String? storageCode = _sharedPreferences.getString('lang');

    if (storageCode == null) {
      ///default set to en_US
      _langCode.value = "en_US";
      Get.updateLocale(Locale(_langCode.value));
      // notifyListeners();
      return "en_US";
    } else {
      // appLogger.d(storageCode.toString(), name: "get storgae lang");
      Get.updateLocale(Locale(storageCode));
      _langCode.value = storageCode;
      // notifyListeners();
      return storageCode;
    }
  }
}
