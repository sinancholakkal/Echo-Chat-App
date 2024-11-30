import 'package:echo_chat/core/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  bool obscureText;
  Widget? prefixIcon;
  final TextEditingController controller;
   TextFieldWidget({super.key,required this.hintText, required this.obscureText,required this.controller, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: grey500)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grey500)
        ),
        fillColor: grey200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: grey500)
      ),
    );
  }
}