import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/address.dart';
import 'package:sneakerapp/data/models/addressModel.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name = TextEditingController();

  late TextEditingController city = TextEditingController();
  late TextEditingController street = TextEditingController();
  AddressData addressData = AddressData(Get.find());
  double? lat;
  double? lng;
  List data = [];
  MyServices services = Get.find();
  Completer<GoogleMapController>? completercontroller;
  Position? postion;
  List<Marker> markers = [];
  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    lng = latLng.longitude;
    update();
  }

  CameraPosition? kGooglePlex;
  goToAddressPartTow() {
    Get.toNamed(AppRouter.addressDetails, arguments: {'lat': lat, "lng": lng});
  }

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 22.4746,
    );
    addMarkers( LatLng(postion!.latitude, postion!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        services.sharedPreferences.getString('id')!,
        name.text,
        city.text,
        street.text,
        lat.toString(),
        lng.toString());
    // print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.offAllNamed(AppRouter.home);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    print("=============================== data $data");
    print("=============================== status is $statusRequest");
    update();
  }
  addAddressCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        services.sharedPreferences.getString('id')!,
        name.text,
        city.text,
        street.text,
        lat.toString(),
        lng.toString());
    // print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
       Get.offAllNamed(AppRouter.cart);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    print("=============================== data $data");
    print("=============================== status is $statusRequest");
    update();
  }
  initial() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    print(lat);
    print(lng);
  }

  @override
  void onInit() {
    initial();
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
