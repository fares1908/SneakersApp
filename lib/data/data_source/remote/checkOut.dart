
import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class CheckOutData {
  Curd crud;
  CheckOutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
