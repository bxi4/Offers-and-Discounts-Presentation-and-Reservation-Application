import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/checkout_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/view/widget/receiptorders/cardpaymenmethod.dart';
import 'package:orop/view/widget/receiptorders/cartdeliverytype.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutConttroller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.secondColor,
          title: const Text("Submit Requests"), //إرسال الطلبات
          elevation: 0.1,
        ),
        bottomNavigationBar: GetBuilder<CheckoutConttroller>(
            builder: (controller2) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    color: AppColor.secondColor,
                    textColor: Colors.white,
                    onPressed: () {
                      controller2.checkout();
                    },
                    child: const Text(
                      "Submit Your Requests",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                )),
        body: GetBuilder<CheckoutConttroller>(
            builder: (controller) => HaindlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.all(20),
                      child: ListView(children: [
                        const Text(
                          "Choose Payment Method", //اختر وسيلة الدفع
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                            onTap: () {
                              controller.choosePaymentMethod("0");
                            },
                            child: CardPaymentMethod(
                                title: "Upon Receipt", //عند الاستلام
                                isActive: controller.paymentMethod == "0"
                                    ? true
                                    : false)),
                        const SizedBox(height: 10),
                        InkWell(
                            onTap: () {
                              controller.choosePaymentMethod("1");
                            },
                            child: CardPaymentMethod(
                                title: "Payment Cards", //بطاقات الدفع
                                isActive: controller.paymentMethod == "1"
                                    ? true
                                    : false)),
                        const SizedBox(height: 20),
                        const Text(
                          "Please Choose Receive",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliveryType("1"); //1 => Revice
                              },
                              child: CardDeliveryTypeCheckout(
                                  imagename: AppImageAsset.recepitorder,
                                  title: "Receive",
                                  active: controller.deliveryType == "1"
                                      ? true
                                      : false),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                controller
                                    .chooseDeliveryType("0"); // 0 => Delivery
                              },
                              child: CardDeliveryTypeCheckout(
                                  imagename: AppImageAsset.cancel,
                                  title: "cancel",
                                  active: controller.deliveryType == "0"
                                      ? true
                                      : false),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // if (controller.deliveryType == "0")
                        //   Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       const Text(
                        //         "Shipping Address",
                        //         style: TextStyle(
                        //             color: AppColor.primaryColor,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 16),
                        //       ),
                        //       const SizedBox(height: 10),
                        //       Card(
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           child: const ListTile(
                        //               title: Text("Company"),
                        //               subtitle: Text(
                        //                   "Damascus Street One Building 23 "))),
                        //     ],
                        //   )
                      ])),
                )));
  }
}
