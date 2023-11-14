import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class MyFavoriteData{
  Curd curd;
  MyFavoriteData(this.curd);
  getData(String id) async {
    var response = await curd.postData(AppLink.viewFavourite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await curd.postData(AppLink.deleteFavourite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
