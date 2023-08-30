import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final Widget? prifixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool isNum;
  final bool isSecure;
  String? Function(String?)? validation;
  TextEditingController controller;
  CustomInput({
    super.key,
    required this.prifixIcon,
    required this.hintText,
    required this.controller,
    this.isNum = false,
    this.isSecure = false,
    required this.validation,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNum ? TextInputType.phone : TextInputType.text,
      obscureText: isSecure,
      decoration: InputDecoration(
          hintText: hintText, prefixIcon: prifixIcon, suffixIcon: suffixIcon),
      validator: validation,
    );
  }
}
