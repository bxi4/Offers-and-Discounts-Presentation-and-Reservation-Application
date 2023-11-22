import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/settings_controller.dart' as settings;
import 'package:orop/controller/settings_controller.dart';
import 'package:orop/core/services/services.dart';

class ServiceScreenDrawerController extends GetxController {

  MyServices myServices = Get.find();
  double miniLeftDate = 0;
  int daysLeft = 0;
  int betweenDate = 0;
  String daysLeftNull = "NULL";
  String serviceImage = "";
  String serverLink =
      "https://sultankinggd.000webhostapp.com/orop_ecommerce/upload/services/";

  @override
  void onInit() {
    super.onInit();
    updateData();
  }

  updateData() {
    // String serviceID = myServices.sharedPreferences.getString("services_id")!;
    serviceImage =
        "$serverLink${myServices.sharedPreferences.getString("services_image")!}";
    String expireServiceDateString =
        myServices.sharedPreferences.getString("services_end_date")!;
    String startServiceDateString =
        myServices.sharedPreferences.getString("services_date")!;
    DateTime expireServiceDate = DateTime.parse(expireServiceDateString);
    DateTime startServiceDate = DateTime.parse(startServiceDateString);
    DateTime dateTime = DateTime.now();
    betweenDate = expireServiceDate.difference(startServiceDate).inDays;
    daysLeft = expireServiceDate.difference(dateTime).inDays;
    daysLeftNull = expireServiceDate.difference(dateTime).inDays.toString();
    miniLeftDate = daysLeft / betweenDate;
    print("$betweenDate $daysLeft $miniLeftDate");
    if (miniLeftDate < 0) {
      miniLeftDate = 0;
      daysLeftNull = "0";
      
      // alertLogout();
      update();
    }
    update();
  }





}
