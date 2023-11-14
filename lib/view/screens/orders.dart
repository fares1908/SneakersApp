import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sneakerapp/controller/orders/OrdersController.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/data/models/orderModel.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        centerTitle: true,
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
        title: const Text(
          'Orders',
          style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: GetBuilder<OrdersController>(
        builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
          itemBuilder: (context, index) =>
              CustomListOrderCard(listData: controller.data[index]),
          itemCount: controller.data.length,
        ))
      ),
    );
  }
}

class CustomListOrderCard extends GetView<OrdersController> {
  const CustomListOrderCard({Key? key, required this.listData});
  final OrdersModel listData;

  @override
  Widget build(BuildContext context) {
    final ordersDatetime =
        '${listData.ordersDatetime}'; // Replace with your actual date-time value

// Create a Jiffy instance using the provided date-time
    final jiffyInstance =
        Jiffy.parse(ordersDatetime, pattern: "yyyy-MM-dd HH:mm:ss");

// Get the relative time difference
    final timeDifference = jiffyInstance.fromNow();

    print("Relative Time Difference: $timeDifference");
    return Slidable(
      key: ValueKey(listData.ordersId),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(

        motion: ScrollMotion(),
        children: [
          SlidableAction(

              borderRadius: BorderRadius.all(Radius.circular(24)),

              // An action can be bigger than the others.
              onPressed: (_)async {
               await controller.deleteData(listData.ordersId!);
              },
              backgroundColor: Color(0xFFFF1900),
              foregroundColor: Colors.white,
              icon: IconlyBold.delete),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '',
                  ),
                  const Spacer(),
                  Text(
                    timeDifference,
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: 'Order Price :',
                  style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' ${listData.ordersPrice}\$',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans',
                          color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Delivery Price : ',
                  style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${listData.ordersPricedelivery}\$',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans',
                          color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Payment Method : ',
                  style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: controller
                          .printPaymentMethod(listData.ordersPaymentmethod!),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Order Address : ',
                  style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${listData.addressName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'TotalPrice : ',
                      style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${listData.ordersTotalprice}\$",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sans',
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  // MaterialButton(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(12)
                  //   ),
                  //   color: AppColor.primaryColor,
                  //   onPressed: () {
                  //     // Get.toNamed(AppRoute.orderDetails,
                  //     //     arguments: {"ordersModel": listData});
                  //   },
                  //   child: const Text(
                  //     'Details',
                  //     style: TextStyle(
                  //         fontFamily: 'Raleway',
                  //         fontWeight: FontWeight.w700,
                  //         color: Colors.white),
                  //   ),
                  // ),

                ],
              ),
              const SizedBox(
                height: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
