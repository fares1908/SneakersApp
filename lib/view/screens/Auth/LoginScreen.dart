import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/auth/loginController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/functions/validation.dart';
import 'package:sneakerapp/view/widgets/auth/CustomAuthWithGoogle.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTexfield.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTextBody.dart';
import 'package:sneakerapp/view/widgets/auth/customAuthRow.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';

class LoginScreen extends StatelessWidget {
  final LoginControllerImpl controller = Get.put(LoginControllerImpl());

   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(827, 375));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<LoginControllerImpl>(
        builder: (controller) =>HandlingDataRequest(
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
                          headText: 'Hello Again!',
                          bodyText:
                          'Fill Your Details Or Continue With \n Social Media',
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
                                controller: controller.email,
                                titleText: 'Email Address',
                                isNumber: false,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              CustomTextField(
                                valid: (val) {
                                  return validInput(val!, "Password");
                                },
                                onTapIcon: () {
                                  print('1');
                                  controller.toggleShowPassword();

                                },
                                isNumber: false,
                                obscureText: controller.isShowPassword,
                                controller: controller.password,
                                titleText: 'Password',
                                suffixIcon: controller.showPasswordIcon,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    controller.goToRecoveryPassword();
                                  },
                                  child: Text(
                                    'Recovery Password',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 27.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              CustomButtonAuth(
                                textButton: 'Sign In',
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              const CustomAuthWithGoogle(
                                textButton: 'Sign In With Google',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomAuthRow(
                    text: 'New User?',
                    textButton: 'Create Account',
                    onPressed: () {
                      controller.goToSignup();
                    },
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
