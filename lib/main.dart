import 'package:echo_chat/presentation/bloc/login_page/login_page_bloc.dart';
import 'package:echo_chat/presentation/bloc/otp_page/otp_page_bloc.dart';
import 'package:echo_chat/presentation/pages/login_screen/login_page.dart';
import 'package:echo_chat/presentation/pages/screen_otp/screen_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginPageBloc(),
        ),
        BlocProvider(
          create: (context) => OtpPageBloc(),
        ),
      ],
      child: GetMaterialApp(
        home: ScreenLogin(),
      ),
    );
  }
}
