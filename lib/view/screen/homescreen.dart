import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/browsercheck_controller.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/controller/homescreen_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/routes.dart';
import 'package:orop/view/widget/home_server/custombottonappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CartController controller = Get.put(CartController());
    BrowsersCheck controllerCheck = Get.put(BrowsersCheck());
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: ((controller1) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    if (controllerCheck.usersid.value == 21) {
                      sinUptoApp();
                    } else {
                      Get.toNamed(AppRoute.cartscreen);
                    }
                    // Get.toNamed(AppRoute.cartscreen);

                    //Get.delete<CartController>();
                  },
                  child: const Icon(Icons.shopping_cart)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottonAppBarHome(),
              body: controller1.listPage.elementAt(controller1.currentpage),
            )));
  }
}
