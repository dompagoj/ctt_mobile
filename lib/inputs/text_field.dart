import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool passwordField;
  final TextEditingController controller;
  MyTextField({ this.label, this.prefixIcon, this.controller, this.passwordField = false });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: passwordField,
      controller: controller,
      validator: (value) {
        if (value.isEmpty)
          return 'This field is required';
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white30),
        fillColor: Colors.white,
        prefixIcon: Icon(prefixIcon, color: Colors.white30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        )
      ),
    );
  }
}


