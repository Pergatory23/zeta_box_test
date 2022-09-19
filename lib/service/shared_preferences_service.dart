import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  SharedPreferences? _prefs;

  static SharedPreferencesService get find => Get.find<SharedPreferencesService>();

  Future<void> add(String key, String value) async {
    final prefs = await _getSharedPreferencesInstance();
    await prefs.setString(key, value);
  }

  Future<String?> get(String key) async {
    final prefs = await _getSharedPreferencesInstance();
    return prefs.getString(key);
  }

  Future<void> removeKey(key) async {
    final prefs = await _getSharedPreferencesInstance();
    await prefs.remove(key);
  }

  Future<SharedPreferences> _getSharedPreferencesInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }
}
