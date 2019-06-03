import 'package:ctt_mobile/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(35),
        child: LoginForm(),
      ),
    );
  }
}
