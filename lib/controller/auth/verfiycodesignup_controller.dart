import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/data/datasource/remote/auth/verfiycodsignup.dart';

abstract class VerfiyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerfiyCodeSignUpControllerImp extends VerfiyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loding;
    update();
    var response =
        await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
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
    email = Get.arguments['email']; // لاستقبال الايميل
    super.onInit();
  }

  reSend() {
    verfiyCodeSignUpData.resendData(email!);
  }
}
