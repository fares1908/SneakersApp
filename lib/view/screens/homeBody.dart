import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

import 'package:sneakerapp/controller/home/HomeScreenBodyController.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/view/widgets/homeBody/CustomButtonAppBarHome.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenBodyControllerImpl());

    return GetBuilder<HomeScreenBodyControllerImpl>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.grey[100],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomButtonAppBarHome(),

            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRouter.cart);
              },
              child: Icon(
                IconlyLight.bag,

                size:  53.sp,
              ),
            ),
            body: controller.listPage.elementAt(controller.currentPage));
      },
    );
  }
}
