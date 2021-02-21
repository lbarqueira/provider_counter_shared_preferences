import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter with ChangeNotifier {
  int _value;

  Counter(int counter) {
    _value = counter;
    print(_value);
  }

  int get value => _value;

  void increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _value = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt('counter', _value);
    notifyListeners();
  }
}
