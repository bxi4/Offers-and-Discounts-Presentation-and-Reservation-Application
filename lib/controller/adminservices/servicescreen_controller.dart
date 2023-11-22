import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/offers_controller.dart';
import 'package:orop/view/admin_services/adminsettings_screen.dart';
import 'package:orop/view/admin_services/coupon/viewcoupon.dart';
import 'package:orop/view/admin_services/products/report.dart';
import 'package:orop/view/admin_services/products/view.dart';

abstract class ServiceScreenController extends GetxController {
  changPage(int currentpage);
}

class ServiceScreenControllerImp extends ServiceScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const AdminServicesProductsView(),
    const ViewCoupon(),
    const reportView(),
    const AdminSettingsScreen(),
  ];

  List bottonappbar = [
    {"title": "Products", "icon": Icons.home_filled},
    {"title": "Coupon", "icon": Icons.discount},
    //{"title": "profile", "icon": Icons.person_outline},
    {"title": "Report", "icon": Icons.report},
    {"title": "Setings", "icon": Icons.settings},
  ];
  @override
  // ignore: avoid_renaming_method_parameters
  changPage(int i) {
    if (i == 3) {
      //Get.toNamed(AppRoute.myfavorite);
      Get.delete<FavoriteController>();
    }
    if (i == 2) {
      // Get.toNamed(AppRoute.offersview);
      Get.delete<OffersController>();
    }

    // if (i == 1) {
    //   currentpage = i;
    //   Get.toNamed(AppRoute.adminservicesorderscreen);
    //   // Get.delete<AdminServicesOrdarScreenControllerImp>();
    // } else {
    //   if (i != 1) {
    //     currentpage = i;
    //   }
    // }

    currentpage = i;

    update();
  }
}
