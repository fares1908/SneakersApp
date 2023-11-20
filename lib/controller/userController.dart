import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/services/services.dart';

class UserController extends GetxController{
  MyServices services = Get.find();
  StatusRequest statusRequest=StatusRequest.none;
}