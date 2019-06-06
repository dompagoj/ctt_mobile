import 'package:ctt_mobile/app_config.dart';
import 'package:ctt_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import 'MyApp.dart';

GetIt getIt = GetIt();
const appConfig = AppConfig(apiUrl: 'http://192.168.1.5:8000');

void main() {
  getIt.registerSingleton(AuthService(appConfig));

  runApp(MyApp());
}

