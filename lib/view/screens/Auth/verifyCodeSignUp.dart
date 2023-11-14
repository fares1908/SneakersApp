import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/auth/verfiyCodeSignUpController.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTextBody.dart';

class VerifyCodeSignUp extends StatefulWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  State<VerifyCodeSignUp> createState() => _VerifyCodeSignUpState();
}

class _VerifyCodeSignUpState extends State<VerifyCodeSignUp> {
  bool isButtonDisabled = false; // Initialize the button state
  int remainingTimeInSeconds = 0;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<VerifyCodeSignUpImpl>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              const CustomTextBody(
                headText: 'OTP Verification',
                bodyText: 'Please Check Your Email To See The\n Verification Code',
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'OTP Code',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              OtpTextField(
                margin: EdgeInsets.only(right: 43.0.w),
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(10),
                numberOfFields: 5,
                focusedBorderColor: Colors.grey,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  controller.goToSuccessSignUp(verificationCode);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 20.h,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  height: 20.h,
                  onPressed: isButtonDisabled
                      ? null
                      : () {
                    setState(() {
                      isButtonDisabled = true;
                    });

                    // Start a 10-second timer
                    const duration = Duration(seconds: 10);
                    timer = Timer.periodic(duration, (timer) {
                      if (remainingTimeInSeconds == 0) {
                        timer.cancel();
                        setState(() {
                          isButtonDisabled = false;
                        });
                      } else {
                        setState(() {
                          remainingTimeInSeconds = duration.inSeconds - timer.tick;
                        });
                      }
                    });

                    controller.resendCode();
                  },
                  color: AppColor.primaryColor, // Set the button's background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: isButtonDisabled
                      ? Text(
                    'Wait a 10 Seconds to resend',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                    ),
                  )
                      : Text(
                    'Resend Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                )


              ),
            ],
          ),
        ),
      ),
    );
  }
}
