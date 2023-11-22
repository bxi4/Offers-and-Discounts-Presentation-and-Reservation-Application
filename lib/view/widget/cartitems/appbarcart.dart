import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/auth/login_controllel.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/controller/home_server_controller.dart';

class AppBarCart extends StatelessWidget {
  //final CartModel cartModel;
  const AppBarCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CartModel cartModel = Get.put(CartModel());
    HomeServerControllerImp controllerImp = Get.put(HomeServerControllerImp());
    Get.put(CartController());
    return GetBuilder<CartController>(builder: (value) {
      return IconButton(
        icon: const Icon(
          Icons.backspace,
          color: Colors.black,
        ),
        onPressed: () {
          /*Get.snackbar(
          'تنبية',
          ' تم الحذف بنجاح',
          backgroundColor: AppColor.secondColor,
          colorText: Colors.black,
          margin: const EdgeInsets.all(10),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          icon: const Icon(
            Icons.notifications_active,
            color: Colors.black,
          ),
        ); */
          value.deleteFromAllCart(controllerImp.id!);
        },
      );
    });
  }
}
