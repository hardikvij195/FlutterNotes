import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String id, String val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(id, val);
}

addIntToSF(String id, int val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('intValue', 123);
}

addDoubleToSF(String id, int val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('doubleValue', 115.0);
}

addBoolToSF(String id, int val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('boolValue', true);
}

Future<String> getStringValuesSF(String id) async {
  print('1 ----------- id $id');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString(id) ?? '';
  print('2 ----------- $stringValue');
  return stringValue;
}

getBoolValuesSF(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  bool boolValue = prefs.getBool(id) ?? false;
  return boolValue;
}

getIntValuesSF(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return int
  int intValue = prefs.getInt(id) ?? 0;
  return intValue;
}

getDoubleValuesSF(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return double
  double doubleValue = prefs.getDouble(id) ?? 0.0;
  return doubleValue;
}

Future<String> getThemeFromSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  return sharedPref.getString('theme');
}

void setThemeinSharedPref(String val) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sharedPref.setString('theme', val);
}
