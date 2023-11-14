import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:sneakerapp/controller/homeController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/view/screens/home/search.dart';
import 'package:sneakerapp/view/widgets/home/CarouselSlider.dart';
import 'package:sneakerapp/view/widgets/home/categoryList.dart';
import 'package:sneakerapp/view/widgets/home/CustomCurdItem.dart';
import 'package:sneakerapp/view/widgets/home/customRow.dart';
import 'package:sneakerapp/view/widgets/home/customTextFormField.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
    HomePageControllerImpl controller = Get.put(HomePageControllerImpl());

    return SideMenu(
      background: AppColor.secondColor,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'HELLO   ',
                        style: const TextStyle(
                          color: Colors.white, // Text color
                          fontFamily: 'Raleway', // Font family
                          fontWeight: FontWeight.w700, // Font weight (bold)
                          fontSize: 16, // Font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${controller.services.sharedPreferences.getString("username")}'.toUpperCase(),

                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white, // Text color
                              fontFamily: 'Raleway', // Font family
                              fontWeight: FontWeight.w700, // Font weight (bold)
                              fontSize: 16, // Font size
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height: 60.h),
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(IconlyLight.profile,
                    size: 20.0, color: Colors.white),
                title: const Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.cart);
                },
                leading: const Icon(IconlyLight.bag,
                    size: 20.0, color: Colors.white),
                title: const Text(
                  "My Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.favorite);
                },
                leading: const Icon(IconlyLight.heart,
                    size: 20.0, color: Colors.white),
                title: const Text(
                  "Favorites",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.orders);
                },
                leading: const Icon(IconlyLight.category,
                    size: 20.0, color: Colors.white),
                title: const Text(
                  "Orders",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(IconlyLight.notification,
                    size: 20.0, color: Colors.white),
                title: const Text(
                  "Notifications",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.setting);
                },
                leading: const Icon(IconlyLight.setting,
                    size: 20.0, color: Colors.white),
                title: const Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  controller.logout();
                },
                leading: const Icon(IconlyLight.arrowRightSquare,
                    size: 20.0, color: Colors.white),
                title: const Text(
                  "Sign Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                textColor: Colors.white,
                dense: true,

                // padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
      type: SideMenuType.shrikNRotate,
      key: sideMenuKey,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image(
                  image: const AssetImage(
                    ImageAsset.stackText,
                  ), // Corrected image loading
                  color: Colors.black,
                  height: 8.h, // Adjust the image height
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Explore',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Raleway',
                    fontSize: 70.sp, // Adjust the font size
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 12, left: 10),
            child: IconButton(
              onPressed: () {
                final state = sideMenuKey.currentState;
                if (state!.isOpened) {
                  state.closeSideMenu(); // close side menu
                } else {
                  state.openSideMenu(); // open side menu
                }
              },
              icon: SvgPicture.asset('assets/images/drawer.svg'),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 10),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRouter.cart);
                },
                icon: Icon(
                  IconlyLight.bag,
                  color: Colors.black,
                  size: 53.sp,
                ),
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.getData();
          },
          child: GetBuilder<HomePageControllerImpl>(
            builder: (controller) => Container(
              padding: const EdgeInsets.fromLTRB(13, 13, 13, 13),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomTextFormField(
                            onPressed: () {
                              controller.onSearch();
                            },
                            onChanged: (val) {
                              controller.checkSearch(val);
                            },
                            text: 'Looking for shoes',
                            controller: controller.search,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 54.0, // Adjust the width as needed
                            height: 54.0, // Adjust the height as needed
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.offAllNamed(AppRouter.favorite);
                              },
                              child: Center(
                                child: Icon(
                                  IconlyLight.heart,
                                  size: 68.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 4.h,
                                ),
                                const CustomRow(
                                  text1: 'New Arrivals',
                                  text2: ' ',
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                CarouselSliderHome(),

                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway',
                                    fontSize: 36.sp, // Adjust the font size
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        CategoryList(
                                      text:
                                          '${controller.categories[index].categoriesName}',
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 13,
                                    ),
                                    itemCount: 4,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomRow(
                                  text1: 'Popular Shoes',
                                  text2: 'See all',
                                  onTapText: () {
                                    controller.goToPopularShoes();
                                  },
                                ),
                                const CustomCurdItem(),
                                SizedBox(
                                  height: 6.h,
                                ),

                              ],
                            )
                          : Search(controller.listItems)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
