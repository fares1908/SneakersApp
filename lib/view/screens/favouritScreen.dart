import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/MyFavoriteController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/functions/alertExitApp.dart';
import 'package:sneakerapp/view/widgets/home/customFavouritrGridview.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyFavoriteController controller= Get.put(MyFavoriteController());
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          leading:     Padding(
            padding: EdgeInsets.only(left: 12),
            child: InkWell(
              onTap: () {
                Get.offAllNamed(AppRouter.home);
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
            'Favourite',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  IconlyLight.heart,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            await controller.getData();
          },
          child: WillPopScope(
            onWillPop: alertExitApp ,
            child: GetBuilder<MyFavoriteController>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing:1.h,
                      crossAxisSpacing: 12.w,
                      crossAxisCount: 2,
                      childAspectRatio: 1.94.sp,
                    ),
                    itemBuilder: (context, index) =>  CustomListFavouriteViewItem(
                      favouriteId: controller.data[index].favoriteId,
                      itemModel: controller.data[index],
                    ),
                    itemCount: controller.data.length,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
