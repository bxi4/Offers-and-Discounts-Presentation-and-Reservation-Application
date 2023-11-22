import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Try Agein");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
