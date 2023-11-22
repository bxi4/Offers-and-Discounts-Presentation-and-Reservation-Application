//var usersid = int.parse(myServices.sharedPreferences.getString("id")!).obs;

import 'package:get/get.dart';
import 'package:orop/core/services/services.dart';

class BrowsersCheck extends GetxController {
  MyServices myServices = Get.put(MyServices());
var usersid = 0.obs;
RxBool userLoggedIn = false.obs;
@override
  void onInit() {
    usersid.value = int.parse(myServices.sharedPreferences.getString("id")!);
    checkUser();
    super.onInit();
  }

  checkUser() {
    if(usersid.value != 21){
      userLoggedIn.value = true;
    }

  }
}