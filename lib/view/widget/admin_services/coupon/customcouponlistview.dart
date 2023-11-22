import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/coupon/coupon_controller.dart';

class CustomCouponListView extends GetView<CouponController> {
  const CustomCouponListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  child: ListView.builder(
                    itemCount: controller.couponmodel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                        "CouponID: #${controller.couponmodel[index].couponId}")),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width * 0.7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Coupon name: ${controller.couponmodel[index].couponName}"),
                                            Text(
                                                "Coupon count: ${controller.couponmodel[index].couponCount}"),
                                            Text(
                                                "Coupon discount: ${controller.couponmodel[index].couponDiscount}"),
                                            Text(
                                                "Coupon expireDate: ${controller.couponmodel[index].couponExpiredate}"),
                                          ],
                                        ),
                                      ),
                                      // ElevatedButton(onPressed: () {}, child: Text("Edit")),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: InkWell(
                                          onTap: () {
                                            print("tapped");
                                          },
                                          child: Icon(Icons.edit),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      // ElevatedButton(onPressed: () {}, child: Text("Delete")),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: InkWell(
                                          onTap: () {
                                            String couponID = controller.couponmodel[index].couponId!;
                                            controller.deleteCoupon(couponID);
                                          },
                                          child: Icon(Icons.delete),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              );
  }
}