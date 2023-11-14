

import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class   VerifyCodeForgetPasswordData {
  Curd curd;

  VerifyCodeForgetPasswordData(this.curd);

  postData(String verifycode, String email) async {
    var response = await curd.postData(AppLink.verifyCode, {
      "verifycode": verifycode,
      "email": email,
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
