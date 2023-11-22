import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/orderservice_data.dart';

class UpdgradeToSeriveController1 extends GetxController {
  OrderService orderService = OrderService(Get.find());
  late StatusRequest statusRequest;
  TextEditingController serviceName = TextEditingController();
  TextEditingController serviceDesc = TextEditingController();
  TextEditingController serviceAddress = TextEditingController();

  MyServices myServices = Get.find();

  sendData(String serviceTypeID) async {
    String userID = myServices.sharedPreferences.getString("id")!;

    print(
        "$userID | ${serviceName.text} | ${serviceDesc.text} | $serviceTypeID | ${serviceAddress.text}");
    statusRequest = StatusRequest.loding;
    var response = await orderService.upgradeUser(userID, serviceName.text,
        serviceDesc.text, serviceTypeID, serviceAddress.text);
    print("========================== Controller $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("----------------------- Order sent to the server successfully");
        Get.snackbar("Success", "Your order has been sent to the server");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
