import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:orop/controller/adminservices/orders/accepted_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/model/orders_model.dart';

class AdminServicesCardOrdersListAccepted
    extends GetView<AdminServicesOrdersAcceptedController> {
  final OrdersModel listdata;
  const AdminServicesCardOrdersListAccepted({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero(
            //   tag: "${listdata.ordersId}",
            // ),
            Row(
              children: [
                Text(
                  "Orders Number : #${listdata.ordersId!}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                //Text(listdata.ordersDatetime!),
                Text(
                  Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text(
                "Orders Type : ${controller.printOrderType(listdata.ordersType!)}\n"),
            Text("Orders Price : ${listdata.ordersPrice} \$ \n"),
            // Text("Delivery Price : ${listdata.ordersPricedeilvery} \$ \n"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}\n"),
            // Text(
            //     "Orders Status : ${controller.printOrderStatus(listdata.ordersStatus!)}\n"),
            const Divider(),
            Row(
              children: [
                Text("Total Price : ${listdata.ordersTotalprice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                // MaterialButton(
                //   onPressed: () {
                //     Get.toNamed(AppRoute.ordersdetails, arguments: {
                //       "ordersmodel": listdata,
                //     });
                //     // ignore: avoid_print
                //     print("======11111 $listdata");
                //   },
                //   // ignore: sort_child_properties_last
                //   child: const Text("Details"),
                //   color: AppColor.thirdColor,
                //   textColor: AppColor.secondColor,
                // ),
                const SizedBox(width: 10),
                if (listdata.ordersStatus! == "1")
                  MaterialButton(
                    onPressed: () {
                      controller.donePrepare(listdata.ordersId!,
                          listdata.ordersUsersid!, listdata.ordersType!);
                    },
                    // ignore: sort_child_properties_last
                    child: const Text("Done"),
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
