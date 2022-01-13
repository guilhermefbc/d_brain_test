import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static Future<bool> hasPendingVouchers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasPendingVouchers') ?? false;
  }

  static Future<int> getSharedId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
    return counter;
  }

  static setWhetherHasPendingVouchers(bool hasPendingVouchers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasPendingVouchers', hasPendingVouchers);
  }


  static restartSharedId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 0);
  }
}