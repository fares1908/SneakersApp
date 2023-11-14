import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/forgetpassword/forgetPasswordController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

import 'package:sneakerapp/core/functions/validation.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTexfield.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTextBody.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  ForgetPasswordState createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(827, 375));
    Get.put(ForgetPasswordControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<ForgetPasswordControllerImpl>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Form(
              key: controller.formState,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const CustomTextBody(
                          headText: 'Forgot Password',
                          bodyText:
                              'Enter Your Email Account To Reset \n Your Password',
                        ),
                        Padding(
                          padding: EdgeInsets.all(11.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                valid: (val) {
                                  return validInput(val!, "Email");
                                },
                                isNumber: false,
                                controller: controller.email,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              CustomButtonAuth(
                                textButton: 'Reset Password',
                                onPressed: () {
                                  Future.delayed(
                                    const Duration(seconds: 3),
                                    () => Get.dialog(
                                      AlertDialog(
                                     elevation: 12,
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(color: Colors.white)
                                      ),
                                        icon: const Icon(
                                          color: AppColor.primaryColor,
                                            Icons.mail_outline_outlined),
                                        backgroundColor: Colors.white,
                                        title: Text(
                                          "Check Your Email",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Raleway',
                                            fontSize: 45.sp,
                                          ),
                                        ),
                                        content: Text(
                                          "We Have Send Password Recovery Code In Your Email",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 30.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      // Custom transition duration in milliseconds
                                    ),
                                  );
                                  controller.checkemail();
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
