import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/view/screen/auth/loginBrowser.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      middleText: "هل تريد الخروج من التطبيق",
      //radius: 20,
      barrierDismissible: false,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("Yes")),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("No"),
        ),
      ]);
  return Future.value(true);
}

Future<bool> sinUptoApp() {
  Get.defaultDialog(
    title: "!Alert",
    titleStyle: const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    middleText: 'Please login',
    middleTextStyle: const TextStyle(
      fontSize: 18,
      color: Colors.black38,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    radius: 30,
    textCancel: "Back",
    cancelTextColor: Colors.black,
    textConfirm: "login",
    confirmTextColor: Colors.black,
    onCancel: () {
      Get.back();
    },
    onConfirm: () {
      Get.back();
      Get.to(() => LoginBrowser());
      //  Get.back();
    },
    buttonColor: AppColor.primaryColor,
  );
  return Future.value(true);
}
