

import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class CheckEmailData {
  Curd curd;

  CheckEmailData(this.curd);

  postData( String email) async {
    var response = await curd.postData(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
