import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:orop/controller/adminservices/coupon/coupon_controller.dart';
import 'package:orop/core/functions/adminservices/alertaddcopun.dart';
import 'package:orop/view/widget/admin_services/coupon/customcouponlistview.dart';
import 'package:orop/view/widget/admin_services/customappbar.dart';
import 'package:orop/view/widget/admin_services/customfloatingactionbutton.dart';

class ViewCoupon extends StatelessWidget {
  const ViewCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponController());
    return Scaffold(
        floatingActionButton: customFloatingActionButton(),
        appBar: CustomAppBarAdmin2("Coupons"),
        body: Column(
            children: [
              ElevatedButton(onPressed: () {
                alertAddCoupon(context);
              }, child: Text("Add coupon")),
              GetBuilder<CouponController>(
                init: CouponController(),
                builder: (controller) => Expanded(child: SizedBox(height: 450, child: CustomCouponListView())))
            ],
          ),
        );
  }
}
