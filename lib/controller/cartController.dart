import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/cart.dart';
import 'package:sneakerapp/data/models/cartModel.dart';

class CartController extends GetxController {
  MyServices services = Get.find();
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<CartModel> data = [];
  double priceOrders = 0.0;
  double  priceOrdersAfterDelivery = 0.0;
  int totalCountItems = 0;
  addCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        services.sharedPreferences.getString('id')!, itemsid);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        services.sharedPreferences.getString('id')!, itemsid);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(title: '59'.tr, message: '60'.tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

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

// ...
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(services.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalCountItems = int.parse(dataresponsecountprice['totalcount']);
          priceOrders = double.parse(dataresponsecountprice['totalprice']);
          priceOrdersAfterDelivery = double.parse(dataresponsecountprice['totalpriceafterdelivery']);
          print(priceOrders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  removeItem(String cartId) async {
    var response = cartData.deleteData(cartId);
    Get.rawSnackbar(
      backgroundColor: AppColor.primaryColor,
      margin: EdgeInsets.all(10),
      showProgressIndicator: true,
      title: 'Removed From Cart',
      message: ' ',
      borderRadius: 15,
    );
    data.removeWhere((element) => element.cartItemsid == cartId);
    update();
  }

  double calculatePriceAfterDiscount(
      double originalPrice, double discountPercentage) {
    return originalPrice - (originalPrice * discountPercentage / 100);
  }

  resetVarCart() {
    totalCountItems = 0;
    priceOrders = 0.0;
    priceOrdersAfterDelivery=0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();

    view();
  }
  void clearCart() {
    data.clear();
    // You can also reset other cart-related variables if needed.
    totalCountItems = 0;
    priceOrders = 0.0;
    priceOrdersAfterDelivery = 0.0;
    update();
  }

  goToCheckOut() {
    if (data.isEmpty) {
      Get.snackbar("warning", "Cart is empty");
    } else {
      Get.toNamed(AppRouter.checkOut, arguments: {
        "priceOrder": priceOrders.toString(),
      }

      );
    }
  }


  @override
  void onInit() {
    view();
    // addDeliveryCost();
    super.onInit();
  }
}
