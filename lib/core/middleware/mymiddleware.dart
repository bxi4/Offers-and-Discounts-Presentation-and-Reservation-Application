import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  //int? get Priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "4") {
      return const RouteSettings(name: AppRoute.homescreenadmin);
    }
    if (myServices.sharedPreferences.getString("step") == "3") {
      return const RouteSettings(name: AppRoute.homeServer);
    }
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homeServer);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.bordingbrowsers);
    }
    return null;
  }
}
