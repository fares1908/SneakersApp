import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/forgetpassword/resetpassword.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/functions/validation.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTexfield.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTextBody.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';
import 'package:sneakerapp/view/widgets/onBoarding/CustomButton.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: GetBuilder<ResetPasswordControllerImpl>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextBody(
                            headText: 'Reset Password',
                            bodyText: 'Enter Your New Strong Password '),
                        CustomTextField(
                            valid: (val) {
                              validInput(val!, 'password');
                            },
                            controller: controller.password,
                            isNumber: false),
                        CustomTextField(
                            valid: (val) {
                              validInput(val!, 'password');
                            },
                            controller: controller.rePassword,
                            isNumber: false),

                        SizedBox(
                          height: 20,
                        ),
                        CustomButtonAuth(
                          textButton: 'save',
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
