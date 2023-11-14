import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/controller/address/addressview.dart';
import 'package:sneakerapp/core/class/HandlingDataView.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/data/models/addressModel.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
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
          'Shopping Address',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        onPressed: () {
          Get.toNamed(AppRouter.addressAdd);
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GetBuilder<ViewAddressController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemBuilder: (context, index) => CardView(
                  addressModel: controller.data[index],
                  onPressed: () {
                    controller.deleteAddress(controller.data[index].addressId!);
                  },
                ),
                itemCount: controller.data.length,
              )),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({super.key, required this.addressModel, this.onPressed});
  final AddressModel addressModel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Icon(
            IconlyBold.location,
              color: AppColor.primaryColor
          ),
        ),
        title: Text(
          '${addressModel.addressName}',
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        subtitle:
            Text(' ${addressModel.addressStreet} ${addressModel.addressCity}',
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w900,
                color: Colors.grey,
              ),
            ),
        trailing: IconButton(
            onPressed: onPressed, icon: const Icon(
            IconlyBold.delete,
          color: AppColor.primaryColor,
        )),
      ),
    );
  }
}
