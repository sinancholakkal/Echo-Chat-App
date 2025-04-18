import 'dart:developer';

import 'package:echo_chat/core/colors.dart';
import 'package:echo_chat/core/constent.dart';
import 'package:echo_chat/presentation/bloc/otp_page/otp_page_bloc.dart';
import 'package:echo_chat/presentation/pages/screen_home/screen_home.dart';
import 'package:echo_chat/widget/loading_widget.dart';
import 'package:echo_chat/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';

class ScreenOtp extends StatefulWidget {
  ScreenOtp({super.key, required this.phone});
  final String phone;
  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  late PincodeInputFieldsController _controller;

  @override
  void initState() {
    _controller = PincodeInputFieldsController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OtpPageBloc, OtpPageState>(
        listener: (context, state) {
          if(state is OtpVerifyLoadingState){
            loadingWidget(context);
          }
          if(state is OtpVerifiedState){
            Get.to(()=> ScreenHome());
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH50,
                const TextWidget(
                  text: "OTP",
                  size: 38,
                  fontWeight: FontWeight.w400,
                ),
                const TextWidget(
                  text: "Verification",
                  size: 38,
                  fontWeight: FontWeight.w700,
                ),
                Row(
                  children: [
                    const TextWidget(
                      text: "Enter the OTP sent to ",
                      size: 16,
                      color: Color.fromARGB(255, 135, 135, 135),
                    ),
                    TextWidget(
                      text:
                          "${widget.phone.substring(0, 8)}****${widget.phone[widget.phone.length - 1]}",
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                sizedBoxH50,
                Center(
                  child: PincodeInputFields(
                    heigth: 60,
                    width: 60,
                    autoFocus: true,
                    controller: _controller,
                    onChanged: (value) {
                      log(value);
                      if (value.length == 4) {
                        log("call next");
                        context.read<OtpPageBloc>().add(OtpEnteredEvent(otp: value));
                      }
                    },
                  ),
                ),
                sizedBoxH50,
                Center(
                    child: TextWidget(
                  text: "Didn't you receive any code?",
                  color: Colors.red[400],
                  size: 15,
                )),
                Center(
                    child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: "RESEND NEW CODE",
                    color: Colors.red,
                    size: 15,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
