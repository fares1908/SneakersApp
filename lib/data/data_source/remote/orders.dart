import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class OrdersData{
  Curd curd;
  OrdersData(this.curd);
  getOrders(String userid)async {
    var response = await curd.postData(AppLink.orders, {
      "id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteOrders(String id)async{
    var response = await curd.postData(AppLink.deleteOrder,{
      "id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}