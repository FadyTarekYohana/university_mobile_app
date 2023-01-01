import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyDarkTheme = "darkTheme";
  static const _keyCountry = "country";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTheme(bool theme) async =>
      await _preferences!.setBool(_keyDarkTheme, theme);

  static bool getTheme() => _preferences!.getBool(_keyDarkTheme) ?? false;

  static Future setCountry(String country) async =>
      await _preferences!.setString(_keyCountry, country);

  static String getCountry() => _preferences!.getString(_keyCountry) ?? "Egypt";
}
