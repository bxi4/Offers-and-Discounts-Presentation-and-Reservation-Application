import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/data/datasource/remote/auth/verfiycodsignup.dart';
import 'package:orop/data/datasource/remote/forgetpassword/verfiycode.dart';

abstract class VerfiyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verfiycode);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  VerfiyCodeForgetPasswordData verfiyCodeForgetPasswordData =
      VerfiyCodeForgetPasswordData(Get.find());

  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late String verfiycode;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToResetPassword(verfiycode) async {
    statusRequest = StatusRequest.loding;
    update();
    var response =
        await verfiyCodeForgetPasswordData.postdata(email!, verfiycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verfiy Code No Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend() {
    verfiyCodeSignUpData.resendData(email!);
  }
}
