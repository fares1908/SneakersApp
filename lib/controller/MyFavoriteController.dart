import 'package:get/get.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/functions/handlingData.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/data/data_source/remote/myfavourite.dart';
import 'package:sneakerapp/data/models/myFavouritrModel.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  MyServices services = Get.find();

  List<MyFavoriteModel> data = [];
  StatusRequest? statusRequest = StatusRequest.none;


  getData() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    var response =
    await favoriteData.getData(services.sharedPreferences.getString('id')!);
    print(
        '===========================================================Controller $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("data $data");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String favoriteId) {

    var response = favoriteData.deleteData(favoriteId);
    data.removeWhere((element) => element.favoriteId == favoriteId);
    Get.rawSnackbar(title: ' ', message: 'The Item was deleted successfully');
    update();
  }

  @override
  void onInit() {
   getData();
    super.onInit();
  }

}
