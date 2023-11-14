import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/favourite.dart';

class FavoriteController extends GetxController {
  FavouriteData favouriteData = FavouriteData(Get.find());
  Map isFavorite = {};
  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.addData(
        services.sharedPreferences.getString('id')!, itemId);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: 'Congratulation',
          message: 'The Product has been added to the favorites list',
          borderRadius: 15,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.removeFavorite(
        services.sharedPreferences.getString('id')!, itemsid);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: '59'.tr, message: '61'.tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
