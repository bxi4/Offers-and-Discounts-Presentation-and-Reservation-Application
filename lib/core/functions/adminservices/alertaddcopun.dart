
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/coupon/coupon_controller.dart';

// late Future<DateTime?> selectedDate;
CouponController controller = Get.put(CouponController());

Future<bool> alertAddCoupon(BuildContext context) {
  Get.defaultDialog(
      title: "Add product",
      // middleText: "هل تريد الخروج من التطبيق",
      //radius: 20,
      barrierDismissible: false,
      content: Expanded(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Coupon name"
              ),
              controller: controller.couponName,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Coupon count"
              ),
              controller: controller.couponCount,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Coupon discount"
              ),
              controller: controller.couponDiscount,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Coupon time",
              ),
              controller: controller.couponTime,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              controller.addCoupon();
              Get.back();
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
