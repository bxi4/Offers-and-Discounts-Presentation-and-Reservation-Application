import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/orders/pending_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/data/model/orders_model.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeServerControllerImp controllerc = Get.put(HomeServerControllerImp());
    CartController cartController = Get.put(CartController());
    controller.ordersModel = listdata;
    // controllerc.servicesModel.servicesId = listdata.ordersSerid;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Orders Number : #${listdata.ordersId}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                MaterialButton(
                  onPressed: () {
                    if (listdata.ordersStatus != "0") {
                      Get.rawSnackbar(
                          title: "اشعار",
                          forwardAnimationCurve: Curves.decelerate,
                          reverseAnimationCurve: Curves.easeInToLinear,
                          shouldIconPulse: true,
                          showProgressIndicator: true,
                          snackStyle: SnackStyle.GROUNDED,
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 2),
                          margin: const EdgeInsets.all(10),
                          borderRadius: 20,
                          backgroundColor: AppColor.thirdColor,
                          icon: const Icon(
                            Icons.back_hand_rounded,
                            color: Colors.black,
                          ),
                          messageText: const Text(
                            " لا يمكن حذفه لقد تم الموافقة عليه",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ));
                    } else {
                      controller.deleteOrders(listdata.ordersId!);
                    }
                  },
                  child: const Text("Delete"),
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
