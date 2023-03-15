import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:preference_storage/preference_storage.dart';
import 'models/models.dart';

class ServicesApi {
  ServicesApi(
    this._prefs,
  );

  static const api = 'prueba-service.coreinvent.es';
  static const timeLimit = 60;
  final Preferences _prefs;

  Future<DataLogin> login({
    required String username,
    required String password,
  }) async {
    final authData = {
      'email': username,
      'password': password,
    };
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final uri = Uri.https(api, '/api/security/login');
    final responseBody = await post(
      uri,
      headers: headers,
      body: json.encode(authData),
    );
    final dataResponse = jsonDecode(responseBody.body);

    if (dataResponse['success'] == true) {
      final dataLogin = DataLogin.fromJson(
        dataResponse['data'] as Map<String, dynamic>,
      );
      return dataLogin;
    }
    throw Exception('Error en el inicio de sesión');
  }

  Future<bool> logout() async {
    final login = Login.fromJson(
      json.decode(_prefs.token) as Map<String, dynamic>,
    );
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${login.token}',
    };
    final uri = Uri.https(api, '/api/security/logout');
    final responseBody = await post(
      uri,
      headers: headers,
    );
    final dataResponse = jsonDecode(responseBody.body);

    if (dataResponse.containsKey('success') &&
        dataResponse.containsKey('code')) {
      if (dataResponse['success'] == true) {
        try {
          return true;
        } catch (e) {
          throw Exception('Error');
        }
      }
    }
    throw Exception('Error');
  }

// GET Natures Index
  Future<ResponseDataNatures> dataNaturesIndex({
    int pageSize = 100,
  }) async {
    final queryParameters = {
      'page[size]': '$pageSize',
    };
    final login = Login.fromJson(
      json.decode(_prefs.token) as Map<String, dynamic>,
    );
    final uri = Uri.https(
      api,
      '/api/restify/natures',
      queryParameters,
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${login.token}',
    };

    final responseBody = await get(
      uri,
      headers: headers,
    );
    final dataResponse = jsonDecode(responseBody.body);

    if (dataResponse.containsKey('success') &&
        dataResponse.containsKey('code')) {
      if (dataResponse['success'] == true) {
        try {
          return ResponseDataNatures.fromJson(dataResponse);
        } catch (exception, stackTrace) {}
      } else {
        throw Exception('Error en el inicio de sesión');
      }
    }
    throw Exception('Error en el inicio de sesión');
  }

//Post Nature Index Create
  Future<DataNatures> dataNaturesCreate({
    required Map<String, dynamic> data,
  }) async {
    final login = Login.fromJson(
      json.decode(_prefs.token) as Map<String, dynamic>,
    );
    final uri = Uri.https(
      api,
      '/api/restify/natures',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${login.token}',
    };

    final responseBody = await post(
      uri,
      headers: headers,
      body: json.encode(data),
    );
    final dataResponse = jsonDecode(responseBody.body);

    if (dataResponse.containsKey('success') &&
        dataResponse.containsKey('code')) {
      if (dataResponse['success'] == true) {
        try {
          return DataNatures.fromJson(
            dataResponse['data'] as Map<String, dynamic>,
          );
        } catch (exception, stackTrace) {}
      } else {
        throw Exception('Error en el inicio de sesión');
      }
    }
    throw Exception('Error en el inicio de sesión');
  }

  // final headers = {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  //   'Authorization': 'Bearer ${login.token}',
  // };

  // Future<Login> _verifyToken() async {
  //   http.Response response;

  //   final login = Login.fromJson();
  //   {
  //     final headers = <String, String>{
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${login.refreshToken}',
  //     };

  //     try {
  //       response = await _httpClient
  //           .post(
  //             Uri.https(api, '/api/security/refresh-token'),
  //             headers: headers,
  //           )
  //           .timeout(const Duration(seconds: 5));
  //     } catch (exception, stackTrace) {
  //       await Sentry.captureException(
  //         exception,
  //         stackTrace: stackTrace,
  //       );
  //       throw HttpException();
  //     }
  //   }
  // }

  // if (responseBody.containsKey('success') &&
  //     responseBody.containsKey('code')) {
  //   if (responseBody['success'] == true) {
  //     try {
  //       final dataLogin = DataLogin.fromJson(
  //         responseBody['data'] as Map<String, dynamic>,
  //       );
  //       throw JsonDeserializationException();
  //     }
  //   } else {
  //     if (responseBody['code'] as int == 401) {
  //       await Sentry.captureMessage(
  //         'Response Body code: 401, ${responseBody['message']}',
  //       );
  //       throw const HttpRequestFailure(997);
  //     }
  //     await Sentry.captureMessage(
  //       'Response Body code: ${responseBody['code']}, ${responseBody['message']}}',
  //     );
  //     throw HttpRequestFailure(responseBody['code'] as int);
  //   }
  // } else {
  //   await Sentry.captureMessage(
  //     'Json Deserialization Exception: no se corresponde con la estructura esperada de restify',
  //   );
  // throw JsonDeserializationException();
  // }
}
// }
