import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/homeController.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';
class CustomCurdItem extends GetView<HomePageControllerImpl> {
  const CustomCurdItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageControllerImpl controller = Get.put(HomePageControllerImpl());
    return SizedBox(
        height: 200,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            crossAxisCount: 2,
            childAspectRatio: 1.94.sp,
          ),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(9),
                  shape: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: CachedNetworkImage(
                            fit: BoxFit.fitHeight,
                            height: 240.h,
                            width: 260.w,
                            imageUrl:
                                "${AppLink.imageItems}/${controller.items[index].itemsImage}",
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
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
                                controller.items[index].itemsName!,
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
                                    '\$ ${controller.items[index].itemsPrice}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      // Handle adding or removing from favorites
                                    },
                                    child: Container(
                                      height: 34,
                                      width: 44,
                                      decoration: const BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.zero,
                                          topLeft: Radius.circular(18),
                                          bottomRight: Radius.circular(18),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft, // Adjust alignment as needed
                  child: GetBuilder<HomePageControllerImpl>(
                    builder: (controller) {
                      final isFavorite = controller.items[index].favorite;

                      return IconButton(
                        onPressed: () async {
                          if (controller.statusRequest != StatusRequest.loading) {
                            final response = isFavorite == 1
                                ? await controller.removeFavorite(controller.items[index].itemsId!)
                                : await controller.addFavorite(controller.items[index].itemsId!);

                            if (response['status'] == 'success') {
                              controller.items[index].favorite = isFavorite == 1 ? 0 : 1;
                              print("Favorite status updated!");
                            } else {
                              print("Failed to update favorite status.");
                            }
                          }
                        },
                        icon: Icon(
                          controller.items[index].favorite == 1 ? IconlyBold.heart : IconlyLight.heart,
                          size: 18,
                          color: AppColor.primaryColor,
                        ),
                      );
                    },
                  )
                ),
              ],
            );
          },
          itemCount: 2,
        ));
  }
}


