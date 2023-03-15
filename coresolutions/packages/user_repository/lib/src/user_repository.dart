import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:preference_storage/preference_storage.dart';
import 'package:services_api/services_api.dart';

import 'models/models.dart';

class UserRepository {
  UserRepository(
    this._authenticationRepository,
    this._prefs, {
    ServicesApi? servicesApi,
  }) : _servicesApi = servicesApi ?? ServicesApi(_prefs);

  final AuthenticationRepository _authenticationRepository;
  final ServicesApi _servicesApi;
  final Preferences _prefs;
  User? _user;

  Future<DataLogin> login({
    required String username,
    required String password,
  }) async {
    try {
      final dataLogin = await _servicesApi.login(
        username: username,
        password: password,
      );
      final login = Login(
        token: dataLogin.login.token,
        refreshToken: dataLogin.login.refreshToken,
        expiration: dataLogin.login.expiration,
        expiredAt: dataLogin.login.expiredAt,
      );
      _prefs
        ..token = json.encode(login.toJson())
        ..user = json.encode(dataLogin.user.toJson())
        ..userName = username;
      return dataLogin;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _servicesApi.logout();
    } catch (_) {}
    _prefs
      ..token = ''
      ..user = '';
    _authenticationRepository.unauthenticated();
  }

  // Future<void> logOut() async {
  //   try {
  //     await _servicesApi.logOut();
  //   } catch (_) {}
  //   _authenticationRepository.unauthenticated();
  // }

  Future<User?> getUser() async {
    try {
      final user = DataUser.fromJson(
        json.decode(_prefs.user) as Map<String, dynamic>,
      );
      return User.fromJson(user.attributes.toJson());
    } catch (e) {
      rethrow;
    }
    // _prefs.user = json.encode(data.toJson());
  }
}

  // Future<User> getUser() async {
  //   try {
  //     final user = DataUser.fromJson(
  //       json.decode(_localStorage.user) as Map<String, dynamic>,
  //     );

  //     final data = await _servicesApi.getUser(
  //       id: int.parse(user.id),
  //     );
  //     return User.fromJson(user.attributes.toJson());
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
