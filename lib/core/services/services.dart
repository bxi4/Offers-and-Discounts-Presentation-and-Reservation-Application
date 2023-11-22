import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    // Start Services
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    // End Services
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
