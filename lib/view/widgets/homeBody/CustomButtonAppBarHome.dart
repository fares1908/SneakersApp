import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/home/HomeScreenBodyController.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

import 'package:sneakerapp/view/widgets/homeBody/CustomButtonNavBar.dart';

class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenBodyControllerImpl>(
      builder: (controller) {
        return  Container(
            color: Colors.white,
            height: 100,
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              height: 80,
              notchMargin: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                    controller.listPage.length,
                    (index) => CustomButtonNavBar(
                      iconData: controller.iconButton[index],
                      colorItemSelected: controller.currentPage == index
                          ? AppColor.primaryColor
                          : Colors.grey[600],
                      onPressed: () {
                        controller.changePage(index);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}

















