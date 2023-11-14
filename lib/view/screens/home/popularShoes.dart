import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/MyFavoriteController.dart';
import 'package:sneakerapp/controller/homeController.dart';

import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/view/widgets/home/CustomCurdItem.dart';

import 'package:sneakerapp/view/widgets/home/customFavouritrGridview.dart';
import 'package:sneakerapp/view/widgets/home/customgideviewpopularShoes.dart';

class PopularShoes extends StatelessWidget {
  const PopularShoes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImpl());
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
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
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          title: const Text(
            'Popular Shoes',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () {

                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(
                    IconlyLight.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<HomePageControllerImpl>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: const CustomGridViewPopular()),
        ));
  }
}
