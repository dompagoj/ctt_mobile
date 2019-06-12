import 'package:ctt_mobile/app_config.dart';
import 'package:ctt_mobile/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import 'MyApp.dart';

GetIt getIt = GetIt();
const appConfig = AppConfig(apiUrl: 'http://192.168.1.6:8000');
final http = Dio(BaseOptions(
  baseUrl: appConfig.apiUrl,
  headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  },
));


void main() {
  final authService = AuthService(appConfig);
  getIt.registerSingleton(authService);

  http.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        options.headers['authorization'] = authService.token;

        return options;
      }
  ));
  runApp(MyApp());
}
