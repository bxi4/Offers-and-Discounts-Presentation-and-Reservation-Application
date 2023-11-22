import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:orop/controller/onboarding_controller.dart';
import 'package:orop/core/constant/color.dart';

class CustomButtenOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtenOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // OnBoardingControllerImp controller = Get.put(OnBoardingControllerImp());
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 50,
      //  width: 0,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColor.primaryColor,
          child: 
            const Text(
              "Continue ->",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.black,
                fontSize: 15,
              ),
            )),
    );
  }
}
