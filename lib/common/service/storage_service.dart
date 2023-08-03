import 'package:shared_preferences/shared_preferences.dart';

import '../value/constant.dart';

class StorageService {
  late final SharedPreferences prefs;
  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  bool getDeviceFristOpen() {
    return prefs.getBool(AppConstant.STORAGE_DEVICE_OPEN_FRIST_TIME) ?? false;
  }

  bool getIsLoggedIn(){
    return prefs.getString(AppConstant.STORAGE_USER_TOKEN_KEY) == null ? false : true;
  }
}
