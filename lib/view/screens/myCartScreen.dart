import 'package:cached_network_image/cached_network_image.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sneakerapp/controller/cartController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';
import 'package:sneakerapp/core/constant/linkapi.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/data/models/cartModel.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => Container(
            height: 250,
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Subtotal",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffff707b81)),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "\$ ${controller.priceOrders}",
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Delivery",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffff707b81)),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "\$ 10",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ))
                  ],
                ),
              ),
              FDottedLine(
                color: const Color(0xffff707B81),
                width: double.infinity,
                strokeWidth: 2.0,
                dottedLength: 10.0,
                space: 6.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Total Price",
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "\$ ${controller.priceOrdersAfterDelivery}",
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor),
                        ))
                  ],
                ),
              ),
              const Spacer(),
              CustomButtonAuth(onPressed: () {
              controller.goToCheckOut();
              }, textButton: 'Checkout')
            ]),
          ),
        ),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
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
            'My Cart',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Text(
                      '${controller.totalCountItems } Item',
                      style: TextStyle(
                     fontFamily: 'Poppins',
                       fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 207.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          CustomCardCart(cartModel: controller.data[index]),
                      itemCount: controller.data.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomCardCart extends GetView<CartController> {
  const CustomCardCart({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(cartModel.itemsId),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(

        motion: ScrollMotion(),
        children: [
          SlidableAction(

              borderRadius: BorderRadius.all(Radius.circular(24)),

              // An action can be bigger than the others.
              onPressed: (_) {
                controller.removeItem(cartModel.cartItemsid!);
                controller.refreshPage();
              },
              backgroundColor: Color(0xFFFF1900),
              foregroundColor: Colors.white,
              icon: IconlyBold.delete),
        ],
      ),

      child: SizedBox(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  margin: const EdgeInsets.all(12),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${cartModel.itemsImage}",
                    fit: BoxFit.cover,
                    height: 110,
                    width: 80,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cartModel.itemsName}',
                      style: const TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    cartModel.itemsDiscount != "0"
                        ? Row(
                            children: [
                              Text(
                                ' \$ ${controller.calculatePriceAfterDiscount(double.parse(cartModel.itemsPrice!), double.parse(cartModel.itemsDiscount!))} ',
                                style: const TextStyle(
                                  fontFamily: 'sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${cartModel.itemsPrice} ',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Color(0xffff707b81),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            ' \$ ${controller.calculatePriceAfterDiscount(double.parse(cartModel.itemsPrice!), double.parse(cartModel.itemsDiscount!))} ',
                            style: const TextStyle(
                              fontFamily: 'sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColor.primaryColor,
                            ),
                          ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // padding: EdgeInsets.all(9),
                      height: 276.sp,
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.sp),
                        color: AppColor.primaryColor,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              onPressed: () async{
                                await controller.addCart(cartModel.itemsId!);
                                controller.refreshPage();
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 61.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${cartModel.countitems}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 33.sp),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              onPressed: () async{
                               await controller.deleteCart(cartModel.itemsId!);
                               controller.refreshPage();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 61.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
