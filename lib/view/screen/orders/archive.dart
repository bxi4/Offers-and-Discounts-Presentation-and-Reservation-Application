import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/orders/archive_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/widget/orders/orderslistarchive.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OrdersArchiveController controller = Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: (controller) => HaindlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: ((context, index) => CardOrdersListArchive(
                            listdata: controller.data[index],
                          )),
                    ),
                  ))),
    );
  }
}
