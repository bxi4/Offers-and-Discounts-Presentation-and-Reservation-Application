import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/orders/pending_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/widget/orders/orderlistcard.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OrdersPendingController controller = Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: (controller) => HaindlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: ((context, index) => CardOrdersList(
                            listdata: controller.data[index],
                          )),
                    ),
                  ))),
    );
  }
}
