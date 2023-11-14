import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class RegisterData{
  Curd curd;
  RegisterData(this.curd);
  registerData(String email, String password ,String name) async{
    var response =await  curd.postData(AppLink.signUp,{
      "email" : email,
      "password" : password,
      "username" : name
    });
    return response.fold((l) => l, (r) => r);
  }
}