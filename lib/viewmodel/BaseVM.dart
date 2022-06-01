
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseVM extends ChangeNotifier{

  Future saveBool(String key,bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

}