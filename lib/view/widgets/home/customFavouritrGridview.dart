import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sneakerapp/controller/MyFavoriteController.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';
import 'package:sneakerapp/core/functions/getRandomColor.dart';
import 'package:sneakerapp/data/models/myFavouritrModel.dart';
import 'dart:math';
class CustomListFavouriteViewItem extends GetView<MyFavoriteController> {
  const CustomListFavouriteViewItem({super.key, required this.itemModel, required this.favouriteId});
  final MyFavoriteModel itemModel;
  final String favouriteId;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Card(
            elevation: 3,
            margin: const EdgeInsets.all(9),
            shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        height: 250.h,
                        width: 260.w,
                        imageUrl:
                            "${AppLink.imageItems}/${itemModel.itemsImage}",
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BEST SELLER',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Raleway',
                            fontSize: 26.sp,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          itemModel.itemsName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Raleway',
                            fontSize: 30.sp,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 7.8,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$ ${itemModel.itemsPrice}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: getRandomColor(),
                                  radius: 8,
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                CircleAvatar(
                                  backgroundColor:  getRandomColor(),
                                  radius: 8,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topLeft, // Adjust alignment as needed
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    controller.deleteData(itemModel.favoriteId);
                  },
                  icon: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[100],
                    child: const Icon(
                      IconlyBold.heart,
                      color: Color(0xFFF87265),
                      size: 18,
                    ),
                  ),
                ),
              )),
        ],
      );

  }

}
