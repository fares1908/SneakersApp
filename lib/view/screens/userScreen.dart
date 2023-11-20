import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sneakerapp/controller/checkOutController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/validation.dart';
import 'package:sneakerapp/stripe_payment/paymentManger.dart';
import 'package:sneakerapp/view/widgets/auth/CustomTexfield.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';
import 'package:sneakerapp/view/widgets/checkOut/checkOut.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
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
          'Orders',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(33.sp),
            // height: 277.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextField(
                    valid: (val) {
                      return validInput(val!, "Username");
                    },
                    titleText: 'Your Name',
                    // controller: controller.name,
                    isNumber: false,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    valid: (val) {
                      return validInput(val!, "Username");
                    },
                    titleText: 'Your Email',
                    // controller: controller.name,
                    isNumber: false,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    valid: (val) {
                      return validInput(val!, "Username");
                    },
                    titleText: 'Your Password',
                    // controller: controller.name,
                    isNumber: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
