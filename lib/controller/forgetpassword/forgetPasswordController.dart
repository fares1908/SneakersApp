
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/data/data_source/remote/forgetpasssword/checkEmail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();

}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  CheckEmailData checkEmailData= CheckEmailData(Get.find());
  @override
  checkemail() async{
    if (formState.currentState!.validate()) {
      statusRequest=StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("================================ Controller $response");
      statusRequest=handlingData(response);
      if (StatusRequest.success==statusRequest) {
        if (response["status"] =="success") {
          print("=============================== $statusRequest");
          Get.offNamed(AppRouter.verfiyCode, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(title: 'Warning', middleText: 'Email is incorrect');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
    }
  }



  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}

