import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sneakerapp/controller/cartController.dart';
import 'package:sneakerapp/data/data_source/remote/checkOut.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/address.dart';
import 'package:sneakerapp/data/models/addressModel.dart';
import 'package:sneakerapp/stripe_payment/apiKeys.dart';
import 'package:sneakerapp/stripe_payment/paymentManger.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';

class CheckOutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();
  AddressData addressData = AddressData(Get.find());
  CheckOutData checkOutData = CheckOutData(Get.find());
  String? paymentMethod;
  String? deliveryType;
  String addressid = '0';
  late String priceorders;
  List<AddressModel> dataAddress = [];

  ///map//////
  double lat = 0.0;
  double lng = 0.0;
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val, double latt, double lngg) {
    addressid = val;
    lat = latt;
    lng = lngg;
  }
  chooseShippingAddressDrop(String? val) {
    addressid = val!;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(services.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataAddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        // addressid=dataAddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }
  void showImageFilteredDialog() {
    Get.dialog(
      AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        content: SizedBox(
          width: 300, // Adjust width as needed
          height: 280, // Adjust height as needed
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX:.7, sigmaY:.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/images/checkout.svg'),
                    Image.asset(
                      'assets/images/cart2.png',
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Your Payment Is \n Successful',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Raleway',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 175,
                  child: CustomButtonAuth(
                    textButton: 'Back To Shopping',
                    onPressed: () {
                      CartController cartController = Get.find();
                      cartController.clearCart();
                      Get.offAllNamed(AppRouter.home);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.rawSnackbar(
        snackStyle: SnackStyle.FLOATING,
        showProgressIndicator: true,
        backgroundColor: AppColor.primaryColor,
        margin: const EdgeInsets.all(10),
        borderRadius: 15,
        title: 'Error',
        message: 'Please select Your Payment Method',
      );
    }

    // Check if deliveryType is not null and is of type String
    if (addressid == "0") {
      return Get.rawSnackbar(
        snackStyle: SnackStyle.FLOATING,
        showProgressIndicator: true,
        backgroundColor: AppColor.primaryColor,
        margin: const EdgeInsets.all(10),
        borderRadius: 15,
        title: 'Error',
        message: 'Please select Your address',
      );
    }

    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "usersid": services.sharedPreferences.getString("id")!,
      "addressid": addressid.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    try {
      var response = await checkOutData.checkout(data);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);


      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {

          showImageFilteredDialog();

        } else {
          statusRequest = StatusRequest.none;
          Get.snackbar("Error", "try again");
        }
      }
    } catch (e) {
      statusRequest = StatusRequest.none;
      Get.snackbar("Error", "An error occurred. Please try again.");
    }
    update();
  }

  //////payment
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "fares",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    const String url = 'https://api.stripe.com/v1/payment_intents';
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${ApiKeys.privateKey}',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, String> body = {
      'amount': amount,
      'currency': currency,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Assuming the response is in JSON format, you may need to handle parsing accordingly.
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData["client_secret"];
    } else {
      throw Exception('Failed to fetch client secret');
    }
  }
  /////////////////

  @override
  void onInit() {
    priceorders = Get.arguments['priceOrder'];
    getShippingAddress() ?? '';
    super.onInit();
  }
}

