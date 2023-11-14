import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/data/data_source/remote/Auth/verfiyCodeSignUp.dart';

abstract class VerifyCodeSignUp extends GetxController {

  goToSuccessSignUp(String verifyCode);
}
class VerifyCodeSignUpImpl extends VerifyCodeSignUp{
  String? email;
  StatusRequest statusRequest=StatusRequest.none;
  VerifyCodeSignUpData verifyCodeSignUpData=VerifyCodeSignUpData(Get.find());
  @override
  checkCode() {

  }

  @override
  goToSuccessSignUp(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!,verifyCode);
    print('=====================Controller$response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRouter.successSignUp);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Verification code is incorrect");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  Future<void> resendCode() async {
    var response = await verifyCodeSignUpData.resendCode(email!);
    print('=====================Controller$response');
  }


}