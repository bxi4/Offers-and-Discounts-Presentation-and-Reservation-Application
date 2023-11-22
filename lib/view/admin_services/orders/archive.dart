
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/orders/archive_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/widget/admin_services/orders/orderslistarchive.dart';

class AdminServicesOrdersArchiveView extends StatelessWidget {
  const AdminServicesOrdersArchiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AdminServicesOrdersArchiveController controller = Get.put(AdminServicesOrdersArchiveController());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AdminServicesOrdersArchiveController>(
            builder: (controller) => HaindlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) => AdminServicesCardOrdersListArchive(
                          listdata: controller.data[index],
                        )),
                  ),
                )));
  }
}
