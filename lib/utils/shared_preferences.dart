import 'package:evpoint/utils/imports.dart';

class Preferences {
  //helper
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static const String isDarkMode = "isDarkMode";

  static Future<bool> isDark() async {
    final p = await prefs;
    return p.getBool(isDarkMode) ?? false;
  }

  static Future setDarkMode(bool value) async {
    final p = await prefs;
    return p.setBool(isDarkMode, value);
  }
}
