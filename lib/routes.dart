import 'package:ctt_mobile/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static goToHome(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}