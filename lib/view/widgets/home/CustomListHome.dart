// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:sneakerapp/controller/homeController.dart';
// import 'package:sneakerapp/core/constant/linkapi.dart';
// import 'package:sneakerapp/data/models/itemModel.dart';
//
// class CustomListHome extends GetView<HomePageControllerImpl> {
//   const CustomListHome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       height: 220,
//       child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => Items(itemModel: ItemModel.fromJson(controller.items as Map<String, dynamic>)),
//           separatorBuilder: (context, index) => const SizedBox(
//             width: 10,
//           ),
//           itemCount: controller.items.length),
//     );
//   }
// }
// class Items extends GetView<HomePageControllerImpl> {
//   const Items({super.key, required this. itemModel});
//   final ItemModel itemModel;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 20, vertical: 10),
//           margin:
//           const EdgeInsets.symmetric(horizontal: 10),
//           child: Image(
//             image: NetworkImage(
//                 '${AppLink.imageItems}/${itemModel.itemsImage}'),
//             height: 100,
//             width: 150,
//             fit: BoxFit.fill,
//           ),
//         ),
//
//
//       ],
//     );
//   }
// }