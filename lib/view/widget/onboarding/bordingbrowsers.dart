import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/auth/isbrowseruser_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/constant/routes.dart';
import '../../../controller/auth/isbrowseruser_controller.dart';

class Browsersbording extends GetView<IsBrowserUserController> {
  const Browsersbording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(IsBrowserUserController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("Welcome to the first time together",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 18,
              )),
          const SizedBox(height: 25),
          Image.asset(
            AppImageAsset.usersView,
            height: Get.width / 1.3,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 25),
          const Text(
            "Login as browser",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
          ),
          const SizedBox(height: 15),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                  "Please choose if you want to log in as a browser \n\n or log in with your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))),
          const Spacer(),
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.isLoading.value
                          ? null
                          : controller.updatbotton();
                      //controller.isBrowserUser();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    color: AppColor.primaryColor,
                    child: Obx(() => controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            " Browsers ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.black,
                              fontSize: 16,
                            ),
                          )),
                  ),
                  MaterialButton(
                      onPressed: () async {
                        Get.toNamed(AppRoute.login);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      color: AppColor.primaryColor,
                      child: Text(
                        " signUp ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          fontSize: 16,
                        ),
                      )),
                ],
              )),
        ],
      )),
    );
  }
}
