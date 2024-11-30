import 'package:echo_chat/core/colors.dart';
import 'package:echo_chat/core/constent.dart';
import 'package:echo_chat/widget/my_button.dart';
import 'package:echo_chat/widget/text_field.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
   ScreenLogin({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Login method
  void login(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey300,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://imgs.search.brave.com/lMrj5__YGgKvoA0nugtpEG61i5gLeYUjFpLX3fFpGVo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9vSzBIMVdKZkFX/NHBVeVJ1X0JfXy1U/Z3BkMEVwVXAyZjBZ/dFlOakJ1aU5oZGdo/M3VSeWtOR1dOVzJP/akt1b1hFMC1NPXcy/NDAtaDQ4MC1ydw"),
              sizedBoxH50,
              Text("Welcome back, you've been missed!",style: TextStyle(color: grey500,fontSize: 16),),
              sizedBoxH50,
              TextFieldWidget(hintText: "Email",obscureText: false,controller: emailController,prefixIcon: Icon(Icons.email),),
              sizedBoxH10,
              TextFieldWidget(hintText: "Password",obscureText: true,controller: passwordController, ),
              sizedBoxH20,
              MyBottonWidget(text: "Login",onTap: ()=>login(),),
              sizedBoxH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?",style: TextStyle(color: grey500,),),
                  Text("Register now",style: TextStyle(fontWeight: FontWeight.bold,color: grey500),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}