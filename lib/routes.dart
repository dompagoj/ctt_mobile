import 'package:ctt_mobile/services/auth_service.dart';
import 'package:ctt_mobile/widgets/calendar.dart';
import 'package:ctt_mobile/widgets/profile.dart';
import 'package:ctt_mobile/widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Router {
  static goToProfile(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
  }

  static goToHours(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarContainer()));
  }

  static logout(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    final authService = getIt.get<AuthService>();
    authService.token = null;
    authService.user = null;
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }
}