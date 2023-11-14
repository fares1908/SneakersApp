
import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/address.dart';
import 'package:sneakerapp/data/models/addressModel.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;
  MyServices services = Get.find();
  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
    await addressData.getData(services.sharedPreferences.getString('id')!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
        if(data.isEmpty){
          statusRequest = StatusRequest.failure;
        }
      }

      else {
        statusRequest = StatusRequest.failure;
      }
    }
    print("=============================== data $data");
    print("=============================== status is $statusRequest");
    update();
  }

  deleteAddress(String addressid){
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId==addressid);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
