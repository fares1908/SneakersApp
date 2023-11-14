import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class HomeData{
  Curd curd;
  HomeData(this.curd);
   getData(String usersid)async{
     var response=await curd.postData(AppLink.home, {
       "usersid": usersid,
     });
     return response.fold((l) => l, (r) => r);
   }

   searchData(String searchText)async{
     var response=await curd.postData(AppLink.search, {
       "search":searchText
     });
     return response.fold((l) => l, (r) => r);
   }
  addData(String userId, String itemId)async{
    var response=await curd.postData(AppLink.addFavourite, {
      "usersid":userId,
      "itemsid":itemId,

    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await curd.postData(AppLink.removeFavourite, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r);
  }
  getFavData(String id) async {
    var response = await curd.postData(AppLink.viewFavourite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await curd.postData(AppLink.deleteFavourite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}