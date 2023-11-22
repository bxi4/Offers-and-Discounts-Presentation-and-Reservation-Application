import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:orop/controller/orders/archive_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/data/model/orders_model.dart';
import 'package:orop/view/widget/orders/dailograting.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
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
            Text("Company : ${listdata.ordersSername} \n"),
            Text("Orders Price : ${listdata.ordersPrice} \$ \n"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}\n"),
            Text(
                "Orders Status : ${controller.printOrderStatus(listdata.ordersStatus!)}\n"),
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
                  },
                  child: const Text("Details"),
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                ),
                const SizedBox(width: 10),
                if (listdata.ordersRating == "0")
                  MaterialButton(
                    onPressed: () {
                      showDailogRating(context, listdata.ordersId!);
                    },
                    child: const Text("Rating"),
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
