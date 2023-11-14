import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class ItemsData {
  Curd crud;

  ItemsData(this.crud);

  getData(String id, String userid) async {
    var response = await crud.postData(AppLink.items, {"id":id.toString(),"usersid":userid});
    return response.fold((l) => l, (r) => r);
  }
}