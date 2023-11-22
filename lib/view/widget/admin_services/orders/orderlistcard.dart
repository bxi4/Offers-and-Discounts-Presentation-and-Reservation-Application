import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:orop/controller/adminservices/orders/pending_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/data/model/orders_model.dart';

class AdminServicesCardOrdersList
    extends GetView<AdminServicesOrdersPendingController> {
  final OrdersModel listdata;
  const AdminServicesCardOrdersList({Key? key, required this.listdata})
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
            Text(
                "Payment Method : ${controller.printOrderStatus(listdata.ordersStatus!)}\n"),
            Text(
                "Orders Status : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}\n"),
            const Divider(),
            Row(
              children: [
                Text("Total Price : ${listdata.ordersTotalprice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails, arguments: {
                      "ordersmodel": listdata,
                    });
                    print("======11111 $listdata");
                  },
                  child: const Text("Details"),
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                ),
                const SizedBox(width: 10),
                if (listdata.ordersStatus! == "0")
                  MaterialButton(
                    onPressed: () {
                      controller.approveOrders(
                          listdata.ordersUsersid!, listdata.ordersId!);
                    },
                    child: const Text("Approve"),
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                  ),
                if (listdata.ordersStatus! == "1")
                  MaterialButton(
                    onPressed: () {
                      // controller.approveOrders(
                      //     listdata.ordersUsersid!, listdata.ordersId!);
                    },
                    child: const Text("Done Delivery"),
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
