import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class VerifyCodeSignUpData {
  Curd curd;
  VerifyCodeSignUpData(this.curd);

  postData(String email,String verifyCode) async {
    var response = await curd.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifyCode
    });
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email)async{
    var response = await curd.postData(AppLink.resendCode, {
      "email" : email ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
