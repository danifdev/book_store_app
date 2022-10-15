import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorage> get instance async {
    _instance = _instance ?? LocalStorage();
    _preferences = _preferences ?? (await SharedPreferences.getInstance());
    return _instance!;
  }

  set setTheme(String value) {
    _preferences!.setString('theme', value);
  }

  String? get getTheme => _preferences!.getString("theme");
}
