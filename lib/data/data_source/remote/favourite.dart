import 'package:sneakerapp/core/class/curd.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';

class FavouriteData{
  Curd curd;
  FavouriteData(this.curd);
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
}