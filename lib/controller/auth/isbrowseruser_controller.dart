import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/auth/login.dart';

class IsBrowserUserController extends GetxController {
  LoginData loginData = LoginData(Get.find());

  var response;
  // var isLoading = false.obs;
  final RxBool isLoading = false.obs;
  // bool isLoading = false;
  //late TextEditingController username;
  String? userid;
  bool isshowpassword = true; //تابع اظهار واخفاء كلمة المرور
  //دالة اظهار واخفاء كلمة المرور

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  isBrowserUser() async {
    statusRequest = StatusRequest.loding;
    update();
    response = await loginData.isBrowserUser();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data']['users_approve'] == "1") {
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
          userid = myServices.sharedPreferences.getString("id")!;

          myServices.sharedPreferences.setString("step", "2");

          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${userid}");
          Get.offNamed(AppRoute.homeServer);
        } else {
          Get.offNamed(AppRoute.signUp);
        }
      } else {
        Get.defaultDialog(
            title: "Error",
            middleText: "An error occurred. Please add a new user");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  updatbotton() async {
    isLoading.value = true;
    await isBrowserUser();
    //Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
