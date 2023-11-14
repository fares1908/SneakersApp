import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sneakerapp/controller/address/addAddressControler.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTexfield.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';

class AddressAdd extends StatelessWidget {
  AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
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
          'Add address',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<AddAddressController>(
        builder: (controllerPage) => HandlingDataView(
          statusRequest: controllerPage.statusRequest,
          widget: Padding(
            padding: EdgeInsets.all(40.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (p0) {},
                    hinttext: 'like home',
                    labeltext: 'Enter name address',
                    mycontroller: controllerPage.name,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (p0) {},
                    hinttext: 'Like 213 Elkhamsin Street',
                    labeltext: 'Street',
                    mycontroller: controllerPage.street,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (p0) {},
                    hinttext: 'Like Cairo',
                    labeltext: 'City',
                    mycontroller: controllerPage.city,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: 190.h,
                    width: double.infinity,
                    child: controllerPage.kGooglePlex != null
                        ? GoogleMap(
                            onTap: (LatLng latLng) {
                              controllerPage.addMarkers(latLng);
                              print(
                                  "Tapped location - Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");
                            },
                            markers: controllerPage.markers.toSet(),
                            mapType: MapType.normal,
                            initialCameraPosition: controllerPage.kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              controllerPage.completercontroller!
                                  .complete(controller);
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomButtonAuth(
                    textButton: 'Save',
                    onPressed: () {
                      controllerPage.addAddress();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.onTapIcon});
  final String hinttext;
  final String labeltext;
  final IconData? iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == null || obscureText == false ? false : true,
      keyboardType: isNumber == true
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      controller: mycontroller,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 13,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              labeltext,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          suffixIcon: InkWell(
            child: Icon(iconData),
            onTap: onTapIcon,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
