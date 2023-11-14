import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices services = Get.find();
    void makePhoneCall() async {
      final Uri _phoneLaunchUri = Uri(scheme: 'tel', path: '01122436405'); // Replace '1234567890' with the phone number you want to dial.

      if (await canLaunch(_phoneLaunchUri.toString())) {
        await launch(_phoneLaunchUri.toString());
      } else {
        // Handle the case where the phone dialer app is not available.
      }
    }
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
          'Settings',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),

          child: ListView(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color:  Colors.white,
                    )
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRouter.addressAdd);
                        },
                        title: const Text('Add Address',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                        ),
                        trailing: const Icon(IconlyLight.plus),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRouter.addressView);
                        },
                        title: const Text('My Addresss',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        trailing: const Icon(IconlyLight.location),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {},
                        title: const Text('About Us',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        trailing: const Icon(IconlyLight.infoSquare),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () async {
                          makePhoneCall();
                        },
                        title: const Text('Connect Us',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        trailing: const Icon(IconlyLight.call),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRouter.orders);
                        },
                        title: const Text('Order',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        trailing: const Icon(IconlyLight.shieldDone),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          services.sharedPreferences.clear();
                          Get.offAllNamed(AppRouter.login);
                        },
                        title: const Text('Logout',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),),
                        trailing: const Icon(IconlyLight.logout),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
