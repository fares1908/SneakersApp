 import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/models/itemModel.dart';

 class ProductDetailsController extends GetxController{
   late ItemModel itemModel;
   int countItems=0;
   MyServices services = Get.find();
   StatusRequest statusRequest=StatusRequest.none;

   initialData() async {
     statusRequest = StatusRequest.loading;
     final itemModel = Get.arguments?['itemModel'] as ItemModel;
     if (itemModel != null) {
       this.itemModel = itemModel;
       statusRequest = StatusRequest.success;
     } else {
       print("itemModel is null");
       statusRequest = StatusRequest.failure;
     }
     update();
   }



   @override
   void onInit() {
     // TODO: implement onInit
     super.onInit();
     initialData();
   }
}