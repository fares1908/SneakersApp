import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sneakerapp/controller/homeController.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';
import 'package:sneakerapp/data/models/itemModel.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemModel = Get.arguments['itemModel'] as ItemModel;
    final controller = Get.find<HomePageControllerImpl>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: Text(
          'Sneaker Shop',
          style: TextStyle(
            fontSize: 46.sp,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyLight.bag,
                  color: Colors.black,
                  size: 12.h,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                itemModel.itemsName ?? 'Item Name Not Available',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 56.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Text(
                    itemModel.categoriesName ?? 'Category Not Available',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  '\$${itemModel.itemsPrice?.toString() ?? 'Price Not Available'}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 56.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Stack(
            children: [
              Center(
                heightFactor: 0,
                child: Hero(
                  tag: itemModel.itemsId!,
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemModel.itemsImage}",
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
              ),
              Image.asset(
                ImageAsset.slider,
                height: 90.h,
              ),
            ],
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: 74.64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${controller.items[index].itemsImage}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          ReadMoreText(
            style: TextStyle(
                fontSize: 34.sp,
                fontFamily: 'Poppins',
                color: const Color(0xfff707b81)),
            itemModel.itemsDesc ?? 'Item Description Not Available',
            trimLines: 3,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
              height: 2,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 24,
                    child: GetBuilder<HomePageControllerImpl>(
                      builder: (controller) {
                        final isFavorite = itemModel.favorite;
                        return IconButton(
                          onPressed: () async {
                            if (controller.statusRequest !=
                                StatusRequest.loading) {
                              final response = isFavorite == 1
                                  ? await controller
                                      .removeFavorite(itemModel.itemsId!)
                                  : await controller
                                      .addFavorite(itemModel.itemsId!);
                              if (response['status'] == 'success') {
                                itemModel.favorite = isFavorite == 1 ? 0 : 1;
                                print("Favorite status updated!");
                              } else {
                                print("Failed to update favorite status.");
                              }
                            }
                          },
                          icon: Icon(
                            itemModel.favorite == 1
                                ? IconlyBold.heart
                                : IconlyLight.heart,
                            size: 24,
                            color: AppColor.primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    width: 120,
                    height: 50,
                    child: GetBuilder<HomePageControllerImpl>(
                      builder: (controller) {
                        final isCart = itemModel.isCart;
                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () async {
                            if (controller.statusRequest !=
                                StatusRequest.loading) {
                              final response = isCart == 1
                                  ? await controller
                                      .deleteCart(itemModel.itemsId!)
                                  : await controller
                                      .addCart(itemModel.itemsId!);
                              if (response['status'] == 'success') {
                                itemModel.isCart = isCart == 1 ? 0 : 1;
                                controller.update(); // Trigger widget rebuild
                                print("Cart status updated!");
                              } else {
                                print("Failed to update Cart status.");
                              }

                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                IconlyLight.bag,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Text(
                                itemModel.isCart == 1
                                    ? 'Remove From Cart'
                                    : 'Add To Cart',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
