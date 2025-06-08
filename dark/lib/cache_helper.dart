import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBooleanData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBolleanData({required String key}) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool> putStringData({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }
  static String? getStringData({required String key}) {
    return sharedPreferences.getString(key);
  }
  // Add functions for other data types (int, double, List)
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
  static Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }
}
Future<void> initializeCacheHelper() async {
  try {
    await CacheHelper.init();
  } catch (e) {
    // Handle error
    print('Error initializing CacheHelper: $e');
  }
}