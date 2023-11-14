import 'package:get/get.dart';
import 'package:sneakerapp/core/class/curd.dart';


class initialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd()) ;
  }
}