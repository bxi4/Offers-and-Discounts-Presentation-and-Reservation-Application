import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/auth/isbrowseruser_controller.dart';
import 'package:orop/controller/browsercheck_controller.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/offers_controller.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/view/screen/home_server.dart';
import 'package:orop/view/screen/homescreen1.dart';
import 'package:orop/view/screen/myfavorite.dart';
import 'package:orop/view/screen/myprofile.dart';
import 'package:orop/view/screen/notification.dart';
import 'package:orop/view/screen/offers.dart';
import 'package:orop/view/screen/settings_screen.dart';

abstract class HomeScreenController extends GetxController {
  changPage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  // int currentUserID = 21;
  MyServices myServices = Get.find();
  BrowsersCheck browsersCheck = Get.put(BrowsersCheck());

  List<Widget> listPage = [
    const HomeServer(),
    const MyFavorit(),
    const OffersView(),
    const SettingsScreen()
  ];

  // List titlebottonappbar = ["home", "settings", "Profile", "Favorite"];

  List bottonappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "Favorite", "icon": Icons.favorite_outline},
    {"title": "Offers", "icon": Icons.discount_outlined},
    {"title": "me", "icon": Icons.person_outline},
  ];
  @override
  // ignore: avoid_renaming_method_parameters
  changPage(int i) {
    if (browsersCheck.usersid.value == 21 && i == 1) {
      // معرف المستخدم هو 21، عرض تنبيه
      sinUptoApp();
    } else {
      // معرف المستخدم ليس 21، سماح بالوصول إلى الصفحة المطلوبة
      if (i == 2) {
        Get.delete<OffersController>();
      }
      if (i == 1) {
        Get.delete<FavoriteController>();
      }
      currentpage = i;
      update();
    }
  }
}
