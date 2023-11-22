import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/orders/pending_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/widget/admin_services/orders/orderlistcard.dart';

class AdminServicesOrdersPending extends StatelessWidget {
  const AdminServicesOrdersPending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AdminServicesOrdersPendingController controller =
        Get.put(AdminServicesOrdersPendingController());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AdminServicesOrdersPendingController>(
            builder: (controller) => HaindlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        AdminServicesCardOrdersList(
                          listdata: controller.data[index],
                        )),
                  ),
                )));
  }
}
