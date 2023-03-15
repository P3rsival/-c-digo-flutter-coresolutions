import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  // static final Preferences _singleton = Preferences._();

  // factory Preferences() => _singleton;
  // Preferences._();

  final SharedPreferences _prefs;

  // Future<void> init() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }

  Future<void> clearUserSesion() async {
    await Future.wait([
      _prefs.setString('token', ''),
      _prefs.remove("refreshToken"),
      _prefs.remove("emailUser"),
      _prefs.remove("userId"),
      _prefs.remove("userName"),
    ]);
  }

  String get token => _prefs.getString('token') ?? '';
  set token(String value) => _prefs.setString('token', value);

  String get userName => _prefs.getString('userName') ?? '';
  set userName(String value) => _prefs.setString('userName', value);

  String get user => _prefs.getString('user') ?? '';
  set user(String value) => _prefs.setString('user', value);

  String get userId => _prefs.getString('userId') ?? "";
  set userId(String value) => _prefs.setString('userId', value);

  Future<void> clear() async => _prefs.clear();
}
