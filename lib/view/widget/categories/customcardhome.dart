import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/categories_controller.dart';
import 'package:orop/core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  // final String title;
  // final String body;
  const CustomCardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
              itemCount: controller.settingsdata.length,
              itemBuilder: (context, i) {
                final companyData = controller.settingsdata[i];

                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListTile(
                    title: Text(
                      "${companyData['settings_titlehome']}\n",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      companyData['settings_bodyhome'],
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                );
              },
            )),
        Positioned(
            top: -20,
            right: -20,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)),
            )),
      ]),
    );
  }
}
