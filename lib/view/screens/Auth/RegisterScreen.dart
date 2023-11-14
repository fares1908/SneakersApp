import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/auth/registerController.dart';
import 'package:sneakerapp/core/functions/validation.dart';
import 'package:sneakerapp/view/widgets/auth/CustomAuthWithGoogle.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTexfield.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTextBody.dart';
import 'package:sneakerapp/view/widgets/auth/customAuthRow.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterControllerImpl());
    ScreenUtil.init(context, designSize: const Size(827, 375));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<RegisterControllerImpl>(
        builder: (controller) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Form(
            key: controller.formState,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const CustomTextBody(
                          headText: 'Register Account',
                          bodyText:
                              'Fill Your Details Or Continue With \n Social Media'),
                      Padding(
                        padding: EdgeInsets.all(11.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           CustomTextField(
                             valid:  (val) {
                              return validInput(val!,"Username");
                             },
                             titleText: 'Your Name',
                              controller: controller.name,
                             isNumber: false,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                       CustomTextField(
                         valid:  (val) {
                           return  validInput(val!,"Email");
                         },
                         isNumber: false,
                              controller: controller.email,
                              titleText: 'Email Address',
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                             CustomTextField(
                               valid:  (val) {
                                 return validInput(val!,"Password");
                               },
                               isNumber: false,
                              titleText: 'Password',
                              onTapIcon: () {
                                controller.changeIsShowPassword();
                                controller.showPassword();
                              },
                               controller: controller.password,
                              obscureText: controller.isShowPassword,
                              suffixIcon: controller.showPasswordIcon,
                              // suffixIcon:
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                           CustomButtonAuth(
                                textButton: 'Sign Up',
                              onPressed:() {
                                controller.goToRegister();
                              },
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            const CustomAuthWithGoogle(
                                textButton: 'Sign Up With Google')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
               CustomAuthRow(
                    text: 'Already Have Account?',
                    textButton: 'Log In',
                  onPressed: () {
                    controller.goToLogin();
                  },

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
