import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const DARK_BLUE = const Color(0xff394256);
const GREY = const Color(0xffd1d1d1);

var theme = ThemeData(
  primaryColor: DARK_BLUE,

);

Widget darkText(String text, [double fontSize]) => Text(text, style: TextStyle(color: Colors.black, fontSize: fontSize));
Widget whiteText(String text, [double fontSize]) => Text(text, style: TextStyle(color: Colors.white, fontSize: fontSize));
Widget greyText(String text, [double fontSize]) => Text(text, style: TextStyle(color: Colors.grey, fontSize: fontSize));
