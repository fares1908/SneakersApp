import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    // await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    await requestPerLocation();
    return this;
  }

  Future<Position> requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        throw Exception('Location services are disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        throw Exception('Location permissions are denied.');
      } else if (permission == LocationPermission.deniedForever) {
        print('Location permissions are permanently denied.');
        throw Exception('Location permissions are permanently denied.');
      }
    }

    // You can now return a Position object.
    return await Geolocator.getCurrentPosition();
  }


}

Future<void> initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
