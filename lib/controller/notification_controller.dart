import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/orders/notification_data.dart';
import 'package:orop/data/model/notificationmodel.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  HomeServerControllerImp controller = Get.put(HomeServerControllerImp());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  int countitems = 0;

  // NotificationModel? notificationModel;
  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  intialData() async {
    //  notificationRead();
    countitems = await quantity();
  }

  @override
  void onInit() {
    getData();
    intialData();
    super.onInit();
  }

  notificationRead() async {
    statusRequest = StatusRequest.loding;
    var response = await notificationData
        .notificationRead(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("========================== Controller Read $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoute.notification);
        controller.getdata();
      } else {
        statusRequest = StatusRequest.failure;
        Get.toNamed(AppRoute.notification);
        Get.delete<NotificationController>();
      }
    }
  }

  quantity() async {
    statusRequest = StatusRequest.loding;
    var response = await notificationData
        .notificationCount(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);

        print("========================================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  // resetVarNotification() {
  //   countitems = 0;
  //   controller.isNotificationRead == false;
  //   //controller.notification.clear();
  //   data.clear();
  // }

  // refershPage() {
  //   resetVarNotification();
  //   getData();
  // }
} //MAM35318316


