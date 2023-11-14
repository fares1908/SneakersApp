

import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class ResetPasswordData {
  Curd curd;

  ResetPasswordData(this.curd);

  postData( String email , String password)  async {
    var response = await curd.postData(AppLink.resetPassword, {
      "email": email,
      "password":password
    });
    return response.fold((l) => l, (r) => r);
  }
}
