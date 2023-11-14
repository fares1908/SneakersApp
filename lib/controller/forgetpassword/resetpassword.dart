
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/data/data_source/remote/forgetpasssword/resetPassword.dart';
abstract class ResetPasswordController extends GetxController {
  checkNewPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? email;
  StatusRequest statusRequest=StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  goToSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(middleText: '"Passwords Not Match', title: 'Warning');
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!,password.text);
      print("==================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouter.successResetPassword);
        } else {
          Get.defaultDialog(title:  "Warning", middleText: "Try Again",);
          statusRequest=StatusRequest.failure;
        }
      }
      update();
    } else {
      print('Not-Valid');
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  checkNewPassword() {}
}
