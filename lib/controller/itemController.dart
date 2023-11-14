import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/home.dart';
import 'package:sneakerapp/data/data_source/remote/items.dart';
import 'package:sneakerapp/data/models/itemModel.dart';

abstract class ItemsController extends GetxController {
  @override
  intialData();
  selectCat(int x, String catVal);
  goToProductDetails(ItemModel itemModel);
}

class ItemsControllerImpl extends ItemsController {
  TextEditingController? search;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List<ItemModel> listItems = [];
  bool isSearch = false;
  checkSearch(val) {
    if (val == '') {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.searchData(search!.text);
    print("===================================Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        listItems.clear();
        List responseData = response['data'];
        listItems.addAll(responseData.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  onSearch() {
    isSearch = true;
    searchData();
    update();
  }

  String? catId;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices services = Get.find();

  List data = [];

  StatusRequest? statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        catId!, services.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    print("=============================== data $data");
    print("=============================== status is $statusRequest");
    update();
  }

  int? selectedCat;
  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    getData();
    ;
  }

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
    intialData();
  }

  @override
  selectCat(x, catVal) {
    selectedCat = x;
    catId = catVal;
    getData();
    update();
    data.clear();
  }

  @override
  goToProductDetails(itemModel) {
    Get.toNamed("productDetails", arguments: {
      "itemModel": itemModel,
    });
  }
}
