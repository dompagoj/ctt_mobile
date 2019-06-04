import 'package:ctt_mobile/routes.dart';
import 'package:ctt_mobile/theme.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String username;
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Form(
          autovalidate: autoValidate,
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty)
                    return 'Nemre bre bit prazno!';
                },
                onSaved: (value) => setState(() => username = value),
                decoration: InputDecoration(
                    labelText: 'Company name',
                    prefixIcon: Icon(Icons.face, size: 30, color: GREY),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: GREY,
                    ))),
              ),
              SizedBox(
                height: 25,
              ),
              FlatButton(
                child: Text('Click me!'),
                onPressed: login,
              )
            ],
          ),
        ),
      ),
    );
  }

  login() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
    setState(() {
      autoValidate = true;
    });
    print(username);
  }
}
