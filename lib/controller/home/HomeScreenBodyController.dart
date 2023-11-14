import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/view/screens/favouritScreen.dart';
import 'package:sneakerapp/view/screens/home/home.dart';
import 'package:sneakerapp/view/screens/settingScreen.dart';
import 'package:sneakerapp/view/screens/userScreen.dart';

abstract class HomeScreenBodyController extends GetxController {
  changePage(int index);
}

class HomeScreenBodyControllerImpl extends HomeScreenBodyController {
  int currentPage = 0;
  List<Widget> listPage = [
    const HomeScreen(),
    const FavouriteScreen(),
    const SettingScreen(),

    const UserScreen(),
  ];

  List<IconData> iconButton = [
    IconlyLight.home,
    IconlyLight.heart,
    IconlyLight.setting,

    IconlyLight.profile,
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
