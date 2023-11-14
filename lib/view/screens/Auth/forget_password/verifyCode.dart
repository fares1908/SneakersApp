import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/forgetpassword/verifyCodeController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTextBody.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';

class verifyCode extends StatelessWidget {
  verifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyControllerImpl());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<VerifyControllerImpl>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(children: [
                    const CustomTextBody(
                      headText: 'OTP Verification',
                      bodyText:
                          'Please Check Your Email To See The Verification Code',
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      fieldWidth: 50.0,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: const Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.goToResetPasswordCode(verificationCode);
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 40),
                  ]),
                ),
              )),
    );
  }
}
