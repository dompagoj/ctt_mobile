import 'package:ctt_mobile/theme.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Company name',
                  prefixIcon: Icon(Icons.face, size: 30, color: GREY),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: GREY,
                    )
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
