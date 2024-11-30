import 'package:echo_chat/core/colors.dart';
import 'package:flutter/material.dart';

class MyBottonWidget extends StatelessWidget {
  String text;
  void Function()? onTap;
   MyBottonWidget({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: grey200,
          borderRadius: BorderRadius.circular(30),
        
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}