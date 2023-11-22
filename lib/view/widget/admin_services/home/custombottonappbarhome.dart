import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/orders/screen_controller.dart';
import 'package:orop/view/widget/admin_services/home/custombuttonappbar.dart';

class CustomBottonAppBarHome extends StatelessWidget {
  const CustomBottonAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    GetBuilder<AdminServicesOrdarScreenControllerImp>(
        builder: ((controller) => 
        BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length, ((index) {
                    return Expanded(
                        child: CustomButtonAppBar(
                            textbutton: controller.bottonappbar[index]['title'],
                            icondata: controller.bottonappbar[index]['icon'],
                            onPressed: () {
                              controller.changPage(index);
                            },
                            active: controller.currentpage == index
                                ? true
                                : false));
                  }))
                ],
              ),
            )));
  }
}
