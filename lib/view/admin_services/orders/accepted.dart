import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/orders/accepted_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/widget/admin_services/orders/orderlistcardaccepted.dart';

class AdminServicesOrdersAccepted extends StatelessWidget {
  const AdminServicesOrdersAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AdminServicesOrdersAcceptedController controller = Get.put(AdminServicesOrdersAcceptedController());
    return Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AdminServicesOrdersAcceptedController>(
            builder: (controller) => HaindlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) => AdminServicesCardOrdersListAccepted(
                          listdata: controller.data[index],
                        )),
                  ),
                )));
  }
}
