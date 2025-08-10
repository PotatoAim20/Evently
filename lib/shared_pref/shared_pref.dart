import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static setFirstTimeComplete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }

  static isFirstTimeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }
}
