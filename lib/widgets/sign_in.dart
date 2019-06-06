import 'package:ctt_mobile/forms/signin_form.dart';
import 'package:ctt_mobile/services/auth_service.dart';
import 'package:ctt_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../routes.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final authService = getIt.get<AuthService>();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK_BLUE,
      body: Builder(
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 150, left: 25, right: 25, bottom: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset('assets/icon.png', height: 100, width: 100),
                    SizedBox(height: 30),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 20, right: 5, bottom: 20, left: 5),
                        child: SignInForm(
                          formKey: _formKey,
                          autoValidate: _autoValidate,
                          emailController: emailController,
                          passwordController: passwordController,
                        )
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 30),
                    RaisedButton(
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.all(20),
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () => onSubmit(context),
                    )
                  ],
                ),
              ),
            ),
      ),
    );
  }

  showError(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text('Invalid username or password'),
      backgroundColor: Colors.red,
    ));
  }

  onSubmit(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return this.setState(() {
        _autoValidate = true;
      });
    }
    var response =
        await authService.login(email: emailController.text, password: passwordController.text);

    if (response == null) return showError(context);
    authService.token = response['token'];
    authService.user = response['user'];
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(('token'), response['token']);
    Router.goToHome(context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
