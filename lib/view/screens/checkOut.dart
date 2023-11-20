import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sneakerapp/controller/checkOutController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/data/models/addressModel.dart';
import 'package:sneakerapp/stripe_payment/paymentManger.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';
import 'package:sneakerapp/view/widgets/checkOut/checkOut.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    GoogleMapController? mapController;
    CheckOutController controller = Get.put(CheckOutController());
    void updateMapForAddress(String addressId, double lat, double lng) {
      setState(() {
        mapController?.animateCamera(
          CameraUpdate.newLatLng(LatLng(lat, lng)),
        );
      });
    }

    return Scaffold(
        backgroundColor: Colors.grey[100],
        bottomNavigationBar: GetBuilder<CheckOutController>(
          builder: (controller) => Container(
              padding: const EdgeInsets.all(10),
              height: 70,
              child: CustomButtonAuth(
                onPressed: () async {
                  if (controller.addressid != "0" ||
                      controller.paymentMethod == null) {
                    if (controller.paymentMethod == "1") {
                      try {
                        // Convert the floating-point string to an integer string and then parse it.
                        int amount =
                            int.parse(controller.priceorders.split('.').first);
                        // Make the payment (assuming it's a synchronous operation)
                        await PaymentManagerStrip.makePayment(amount, "USD");
                        // Proceed with the checkout
                        controller.checkout();
                      } catch (e) {
                        print("Error parsing 'controller.priceorders': $e");
                        // You may want to handle the error or display a message to the user.
                      }
                    } else {
                      controller.checkout();
                    }
                  } else {
                    Get.rawSnackbar(
                      snackStyle: SnackStyle.FLOATING,
                      showProgressIndicator: true,
                      backgroundColor: AppColor.primaryColor,
                      margin: const EdgeInsets.all(10),
                      borderRadius: 15,
                      title: 'Error',
                      message: 'Please select your address ',
                    );
                  }
                },
                textButton: 'Make Order',
              )),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  IconlyLight.arrowLeft2,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          title: const Text(
            'Orders',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        body: GetBuilder<CheckOutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(33.sp),
                  // height: 277.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Information',
                          style: TextStyle(
                              fontSize: 34.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        ListTile(
                          leading: const Icon(Icons.email_outlined),
                          title: Text(
                            '${controller.services.sharedPreferences.getString("email")}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text('Email'),
                          // trailing: IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(Icons.edit_outlined),
                          // ),
                        ),
                        // DropdownButtonFormField(
                        //   icon: Icon(
                        //     Icons.abc
                        //   ),
                        //   padding: EdgeInsets.all(8),
                        //
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide.none,
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //   ),
                        //   items: controller.dataAddress.map((e) {
                        //     return DropdownMenuItem(
                        //       child: Text('${e.addressName}'),
                        //       value: e.addressId, // Use a unique identifier as the value
                        //     );
                        //   }).toList(),
                        //   onChanged: (value) {
                        //     // Handle the selected value
                        //   },
                        // ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Payment Method',
                          style: TextStyle(
                              fontSize: 34.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.choosePaymentMethod("0");
                                },
                                child: CustomCardPayment(
                                    icon: IconlyLight.wallet,
                                    text: 'Cash',
                                    isActive: controller.paymentMethod == "0"
                                        ? true
                                        : false),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    controller.choosePaymentMethod('1');
                                  },
                                  child: CustomCardPayment(
                                    icon: Icons.payment,
                                    text: 'Visa Card',
                                    isActive: controller.paymentMethod == '1'
                                        ? true
                                        : false,
                                  )),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 34.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(AppRouter.addressView);
                              },
                              icon: const Icon(Icons.edit_outlined),
                            ),
                          ],
                        ),
                        controller.dataAddress.isEmpty
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child:  IconButton(
                                    onPressed: () {
                                      Get.toNamed(AppRouter.addAddressCart);
                                    },
                                    icon: const Icon(Icons.add),
                                )
                              )
                            : SizedBox(
                                height: 130,
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 1,
                                          mainAxisSpacing: .1,
                                          crossAxisCount: 1),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        controller.chooseShippingAddress(
                                          controller
                                              .dataAddress[index].addressId!,
                                          double.parse(controller
                                              .dataAddress[index].addressLat!),
                                          double.parse(controller
                                              .dataAddress[index].addressLong!),
                                        );
                                        updateMapForAddress(
                                          controller
                                              .dataAddress[index].addressId!,
                                          double.parse(controller
                                              .dataAddress[index].addressLat!),
                                          double.parse(controller
                                              .dataAddress[index].addressLong!),
                                        );
                                        print(controller
                                            .dataAddress[index].addressName!);
                                        print(
                                          double.parse(controller
                                              .dataAddress[index].addressLat!),
                                        );
                                        print(controller.lat);
                                        print(controller.lng);
                                      },
                                      child: CustomCardShoppingAddress(
                                          text1: controller
                                              .dataAddress[index].addressName!,
                                          text2:
                                              '${controller.dataAddress[index].addressStreet!} ${controller.dataAddress[index].addressCity!}',
                                          isActive: controller.addressid ==
                                                  controller.dataAddress[index]
                                                      .addressId
                                              ? true
                                              : false),
                                    );
                                  },
                                  itemCount: controller.dataAddress.length,
                                ),
                              ),
                        if (controller.addressid != "0")
                          Card(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 90.h,
                              width: double.infinity,
                              child: GoogleMap(
                                onMapCreated: (controller) {
                                  setState(() {
                                    mapController = controller;
                                  });
                                },
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  zoom: 15, // Adjust the zoom level as needed
                                  target:
                                      LatLng(controller.lat, controller.lng),
                                ),
                                markers: <Marker>{
                                  Marker(
                                    markerId: const MarkerId(
                                        "1"), // A unique ID for your marker
                                    position: LatLng(
                                        controller.lat,
                                        controller
                                            .lng), // Coordinates for the marker
                                    infoWindow: const InfoWindow(
                                      title: "Your Marker Title",
                                      snippet: "Your Marker Description",
                                    ),
                                    // You can customize the marker icon here:
                                    icon: BitmapDescriptor.defaultMarker,
                                  ),
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
