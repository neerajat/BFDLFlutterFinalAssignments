import 'package:shared_preferences/shared_preferences.dart';

enum ImageSourceType { gallery, camera }

Future<bool?> getBool(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return  prefs.getBool(key)?? false;
}

Future saveBool(String key,bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}