import 'package:shared_preferences/shared_preferences.dart';

class CounterSharedPreferences {
  Future<bool> saveDate(int counter) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.setInt('counter', counter);
  }

  Future<int> getData() async {
    final prefs = await SharedPreferences.getInstance();

    final counter = prefs.getInt('counter') ?? 0;

    return counter;
  }

  Future<bool> removeData() async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.remove('counter');
  }
}
