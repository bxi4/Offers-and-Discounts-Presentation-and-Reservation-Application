import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/browsercheck_controller.dart';
import 'package:orop/controller/productdetails_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';

class ProductDetailsItems extends StatelessWidget {
  const ProductDetailsItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool click = true;
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    BrowsersCheck controllerCheck = Get.put(BrowsersCheck());
    var usersid =
        int.parse(controller.myServices.sharedPreferences.getString("id")!);
    // CartController controllerCrat = Get.put(CartController());
    return Row(
      children: [
        GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => Container(
              width: 150,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  //color: Colors.grey.shade200,
                  color: const Color.fromARGB(255, 201, 221, 238),
                  borderRadius: BorderRadius.circular(999)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (usersid == 21) {
                        sinUptoApp();
                      } else {
                        controller.remove();
                      }
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(Icons.remove, color: AppColor.black),
                    ),
                  ),
                  Text(
                    "${controller.countitems}",
                    style: const TextStyle(fontSize: 20, color: AppColor.black),
                  ),
                  InkWell(
                    onTap: () {
                      //click = !click;
                      if (usersid == 21) {
                        sinUptoApp();
                      } else {
                        controller.add();
                      }
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(Icons.add, color: AppColor.black),
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Get.toNamed(AppRoute.cartscreen);
              if (controllerCheck.usersid.value == 21) {
                sinUptoApp();
              } else {
                Get.toNamed(AppRoute.cartscreen);
              }
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor),
                fixedSize:
                    MaterialStateProperty.all(const Size(double.infinity, 65)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            child: const Text("Go to Order ->",
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.black,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }
}
