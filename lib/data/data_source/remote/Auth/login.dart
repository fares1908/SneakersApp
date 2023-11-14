import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class LoginData{
  Curd curd;
  LoginData(this.curd);
  loginData(String password,String email )async{
    var response=await curd.postData(AppLink.login, {
      "email":email,
      "password":password,
    });
    return response.fold((l) => l, (r) => r);
  }
}