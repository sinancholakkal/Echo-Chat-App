
import 'dart:developer';

import 'package:echo_chat/core/colors.dart';
import 'package:echo_chat/core/constent.dart';
import 'package:echo_chat/presentation/bloc/login_page/login_page_bloc.dart';
import 'package:echo_chat/presentation/pages/screen_otp/screen_otp.dart';
import 'package:echo_chat/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';

class OtpButtonSection extends StatelessWidget {
  const OtpButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sizedBoxH20,
          bloc.BlocBuilder<LoginPageBloc, LoginPageState>(
            builder: (context, state) {
              Color color = Colors.white;
              String? phone;
              if (state is OtpButtonColorState) {
                color = state.color;
                phone = state.phone;
              }
              return MyBottonWidget(
                color: color,
                text: "Send OTP",
                onTap: () {
                  //log(phone!.length.toString());
                  if (phone != null && phone.length == 13) {
                    log(phone.toString());
                    Get.to(
                        () => ScreenOtp(
                              phone: phone!,
                            ),
                        transition: Transition.leftToRight);
                  }
                },
              );
            },
          ),
          sizedBoxH20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: TextStyle(
                  color: grey500,
                ),
              ),
              Text(
                "Register now",
                style: TextStyle(fontWeight: FontWeight.bold, color: grey500),
              )
            ],
          )
        ],
      ),
    );
  }
}