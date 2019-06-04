import 'package:ctt_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static goToHome(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}