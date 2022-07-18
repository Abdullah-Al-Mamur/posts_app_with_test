import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  final Future<SharedPreferences> _prefs =
  SharedPreferences.getInstance();

  Future<void> saveString(String key, String value) async {
    final pref = await _prefs;
    await pref.setString(key, value);
  }

  Future<String?> getString(String key) async{
    final pref = await _prefs;
    return pref.getString(key);
  }
}
