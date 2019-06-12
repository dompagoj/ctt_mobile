import 'dart:convert';
import 'dart:core';

import 'package:ctt_mobile/main.dart';
import 'package:ctt_mobile/models/user.dart';
import 'package:http/http.dart' as http;

import '../app_config.dart';

class AuthService {
  final AppConfig _config;
  String _baseUrl;
  String _token;
  User user;
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  AuthService(this._config) {
    this._baseUrl = _config.apiUrl;
  }

  set token(String token) {
    _token = 'bearer $token';
  }

  get token {
    return _token;
  }

  Future<dynamic> login({
    String email,
    String password,
  }) async {
    var body = json.encode({
      "email": email,
      "password": password,
    });
    var response = await http.post(
      '$_baseUrl/auth/company-login',
      body: body,
      headers: headers,
    );
    if (response.statusCode != 200) return null;

    return json.decode(response.body);
  }

  Future<User> getMe() async {
    var response = await http.get('$_baseUrl/me', headers: { 'authorization': _token });
    if (response.statusCode == 401)
      throw Exception();

    return User.fromJson(json.decode(response.body));
  }
}

final authService = AuthService(appConfig);