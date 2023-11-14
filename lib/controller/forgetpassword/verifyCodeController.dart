import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/data/data_source/remote/forgetpasssword/verifyCode.dart';

abstract class VerifyController extends GetxController {
  goToResetPasswordCode(String verifyCode);
}

class VerifyControllerImpl extends VerifyController {
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
  VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  String? email;

  @override
  goToResetPasswordCode(verifyCode) async{
    statusRequest =StatusRequest.loading;
    update();
    var response=await verifyCodeForgetPasswordData.postData(verifyCode, email!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        Get.offNamed(AppRouter.resetPassword,arguments:
        {
          "email":email
        });
      }else{
        Get.defaultDialog(
          title: "Warning",
          middleText: " Verification code is incorrect",
        );
      }
    }
    update();

  }


  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }
}
