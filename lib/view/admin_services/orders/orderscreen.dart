import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/orders/screen_controller.dart';
import 'package:orop/controller/adminservices/servicescreen_controller.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/view/widget/admin_services/home/custombottonappbarhome.dart';

class AdminServicesOrderScreen extends StatelessWidget {
  const AdminServicesOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AdminServicesOrdarScreenControllerImp());
    return GetBuilder<AdminServicesOrdarScreenControllerImp>(
        builder: ((controller) => Scaffold(
              appBar: AppBar(title: const Text("Orders")),
              //drawer: Drawer(),
              bottomNavigationBar: const CustomBottonAppBarHome(),
              body: controller.listPage.elementAt(controller.currentpage),
            )));
  }
}
