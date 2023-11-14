import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/orders.dart';
import 'package:sneakerapp/data/models/orderModel.dart';

class OrdersController extends GetxController{
  List data = [];
  late StatusRequest statusRequest;
  MyServices services=Get.find();
  OrdersData ordersData=OrdersData(Get.find());
  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .getOrders(services.sharedPreferences.getString('id')!);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listData=response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  deleteData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .deleteOrders(id);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {

        Get.rawSnackbar(
          backgroundColor: AppColor.primaryColor,
          margin: EdgeInsets.all(10),
          showProgressIndicator: true,
          title: 'Order was removed successfully',
          message: ' ',
          borderRadius: 15,
        );
        resetOrder();

    }
    update();
  }
  resetOrder(){
    data.clear();
    getData();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}