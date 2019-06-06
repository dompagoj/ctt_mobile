import 'package:ctt_mobile/inputs/text_field.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool autoValidate;
  final emailController;
  final passwordController;

  SignInForm({
    this.formKey,
    this.autoValidate,
    this.emailController,
    this.passwordController,
  });


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidate: autoValidate,
      child: Column(
        children: <Widget>[
          MyTextField(
            label: 'Email',
            prefixIcon: Icons.email,
            controller: emailController,
          ),
          MyTextField(
            label: 'Password',
            prefixIcon: Icons.lock,
            passwordField: true,
            controller: passwordController,
          ),
        ],
      ),
    );
  }
}

