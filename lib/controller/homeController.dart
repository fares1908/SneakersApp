import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/cart.dart';
import 'package:sneakerapp/data/data_source/remote/home.dart';
import 'package:sneakerapp/data/data_source/remote/items.dart';
import 'package:sneakerapp/data/models/cartModel.dart';
import 'package:sneakerapp/data/models/categoryModel.dart';
import 'package:sneakerapp/data/models/itemModel.dart';
import 'package:sneakerapp/data/models/myFavouritrModel.dart';

abstract class HomePageController extends GetxController {
  getData();
}

class HomePageControllerImpl extends HomePageController {
 late StatusRequest statusRequest ;
  MyServices services = Get.find();
  HomeData homeData = HomeData(Get.find());
  TextEditingController? search;
  List<CategoryModel> categories = [];
  List<ItemModel> items = [];
  List<ItemModel> listItems = [];
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  CartData cartData = CartData(Get.find());
  List<CartModel> dataCart = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await homeData.getData(services.sharedPreferences.getString('id')!);
      print("===================================Controller $response");

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List listCat = response["categories"]["data"];
          categories.addAll(listCat.map((e) => CategoryModel.fromJson(e)));
          List listItem = response["items"]["data"];
          items.clear();

          items.addAll(listItem.map((e) {
            // Assuming you have a constructor for ItemModel that takes the "favorite" field into account.
            return ItemModel.fromJson(e);
          }));
          print('Items: $items');
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        // Display the offline Lottie animation
        update();
      } else {
        // Handle other failure cases
        statusRequest = StatusRequest.failure; // or any other appropriate status
      }
    } catch (e) {
      // Handle exceptions if any
      statusRequest = StatusRequest.failure; // or any other appropriate status
    }

    update();
  }

  logout() {
    services.sharedPreferences.clear();
    Get.offAllNamed(AppRouter.login);
  }

  goToPopularShoes() {
    Get.toNamed(AppRouter.popularShoes);
  }

  /// Search
  bool isSearch = false;

  checkSearch(val) {
    if (val == '') {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.searchData(search!.text);
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

  /// Favorites
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  Future<Map<String, dynamic>> addFavorite(String itemId) async {
    statusRequest = StatusRequest.loading;
    // update();
    var response = await homeData.addData(
        services.sharedPreferences.getString('id')!, itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        isFavorite[itemId] = 1;
        Get.rawSnackbar(
          title: 'The Product has been added to the favorites list',
          snackStyle: SnackStyle.FLOATING,
          showProgressIndicator: true,
          backgroundColor: AppColor.primaryColor,
          message: ' ',
          margin: EdgeInsets.all(10),
          borderRadius: 15,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    return response;
  }

  Future<Map<String, dynamic>> removeFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.removeFavorite(
        services.sharedPreferences.getString('id')!, itemsid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // Update the favorite status
        isFavorite[itemsid] = 0;
        Get.rawSnackbar(
          backgroundColor: AppColor.primaryColor,
          margin: EdgeInsets.all(10),
          showProgressIndicator: true,
          title: 'Removed From Favorites',
          message: ' ',
          borderRadius: 15,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    return response;
  }

  getFavData() async {
    statusRequest = StatusRequest.loading;
    var response =
    await homeData.getData(services.sharedPreferences.getString('id')!);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("data $data");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteDataFromFavScreen(String favoriteId) {
    var response = homeData.deleteData(favoriteId);
    data.removeWhere((element) => element.favoriteId == favoriteId);
    Get.rawSnackbar(
      backgroundColor: AppColor.primaryColor,
      margin: EdgeInsets.all(10),
      showProgressIndicator: true,
      title: 'Removed From Favorites',
      message: ' ',
      borderRadius: 15,
    );
    update();
  }

  goToProductDetails(itemModel) {
    Get.toNamed(AppRouter.productDetails, arguments: {
      "itemModel": itemModel,
    });
  }

  // Function to add an item to the cart
  Map isCart = {};

  setCart(id, val) {
    isCart[id] = val;
    update();
  }
  Future<Map<String, dynamic>> addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    // update();
    var response = await cartData.addCart(
        services.sharedPreferences.getString('id')!, itemsid);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        isCart[itemsid] = 1;
        Get.rawSnackbar(
          title: 'The Product has been added to the Cart list',
          snackStyle: SnackStyle.FLOATING,
          showProgressIndicator: true,
          backgroundColor: AppColor.primaryColor,
          message: ' ',
          margin: EdgeInsets.all(10),
          borderRadius: 15,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    return response;
  }

  // Function to delete an item from the cart
  Future<Map<String, dynamic>> deleteCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    try {
      var response = await cartData.deleteData(itemsid);

      if (response is Map<String, dynamic>) {
        print('Response Body: $response');

        if (response.containsKey('status') && response['status'] == 'success') {
          isCart[itemsid] = 0;
          Get.rawSnackbar(
            title: 'The Product has been deleted from the Cart list',
            snackStyle: SnackStyle.FLOATING,
            showProgressIndicator: true,
            backgroundColor: AppColor.primaryColor,
            message: ' ',
            margin: EdgeInsets.all(10),
            borderRadius: 15,
          );
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
      return response; // Return the response
    } catch (e) {
      // Handle any errors
      statusRequest = StatusRequest.failure;
      update();
      throw e; // Throw an exception to indicate the error
    }
  }



  // Function to get the count of a specific item in the cart
  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCountCart(
        services.sharedPreferences.getString('id')!, itemsid);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int countItems = 0;
        countItems = int.parse(response['data']);
        print('$countItems');
        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
