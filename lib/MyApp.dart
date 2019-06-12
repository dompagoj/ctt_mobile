import 'package:ctt_mobile/services/auth_service.dart';
import 'package:ctt_mobile/theme.dart';
import 'package:ctt_mobile/widgets/profile.dart';
import 'package:ctt_mobile/widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getToken(),
        builder: (context, snapshot) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  primaryColor: DARK_BLUE,
                  appBarTheme: AppBarTheme(
                    color: DARK_BLUE,
                  )),
              home: handleLoading(snapshot),
            );
        });
  }

  handleLoading(AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting)
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );

    return snapshot.hasData
        ? Profile()
        : SignIn();
  }

  getToken() async {
    var prefs = await SharedPreferences.getInstance();
    final authService = getIt.get<AuthService>();
    var token = prefs.getString('token');
    if (token == null) return null;

    authService.token = token;
    try {
      authService.user = await authService.getMe();
    } catch (e) {
      await prefs.remove('token');
      return null;
    }

    return token;
  }
}
