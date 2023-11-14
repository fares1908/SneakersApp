import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class CartData{
  Curd curd;
  CartData(this.curd);
  viewCart( String usersid)async{
    var response = await curd.postData(AppLink.cartView,{"usersid":usersid} );
    return response.fold((l) => l, (r) => r);
  }
  addCart(String usersid , String itemsid)async{
    var response=await curd.postData(AppLink.cartAdd, {
      "usersid": usersid,
      "itemsid": itemsid
    });
    return response.fold((l) => l, (r) => r);
  }
 deleteCart(String usersid , String itemsid)async{
    var response=await curd.postData(AppLink.cartDelete, {
      "usersid": usersid,
      "itemsid": itemsid
    });
    return response.fold((l) => l, (r) => r);
  }
  findItemCart(String usersid , String itemsid)async{
    var response=await curd.postData(AppLink.cartFind, {
      "usersid": usersid,
      "itemsid": itemsid
    });
    return response.fold((l) => l, (r) => r);
  }
  getCountCart(String usersid , String itemsid)async{
    var response=await curd.postData(AppLink.cartDelete, {
      "usersid": usersid,
      "itemsid": itemsid
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await curd.postData(AppLink.cartRemove, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}