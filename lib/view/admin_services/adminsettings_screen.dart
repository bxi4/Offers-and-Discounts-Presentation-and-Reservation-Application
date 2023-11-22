import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/service_controller.dart';
import 'package:orop/controller/settings_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/widget/admin_services/customfloatingactionbutton.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      floatingActionButton: customFloatingActionButton(),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: ListView(
            children: [
              GetBuilder<ServiceScreenDrawerController>(
                  init: ServiceScreenDrawerController(),
                  builder: (controller) {
                    return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                              height: Get.width / 3,
                              color: AppColor.primaryColor),
                          // Container(
                          //     padding:
                          //         const EdgeInsets.only(left: 340, bottom: 65),
                          //     child: const Icon(moonIcon, color: Colors.black)),
                          Positioned(
                              top: Get.width / 4.7,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: CircleAvatar(
                                    radius: 45,
                                    backgroundColor: Colors.black,
                                    backgroundImage: NetworkImage(
                                      controller.serviceImage,
                                    )),
                              )),
                        ]);
                  }),
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GetBuilder<ServiceScreenDrawerController>(
                          init: ServiceScreenDrawerController(),
                          builder: (controller) {
                            return Container(
                              color: AppColor.primaryColor,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.daysLeftNull} days left from your ${controller.betweenDate} days sub",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: LinearPercentIndicator(
                                      backgroundColor: Colors.black,
                                      progressColor: Colors.green,
                                      animation: true,
                                      percent: controller.miniLeftDate,
                                      lineHeight: 5,
                                      barRadius: const Radius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      ListTile(
                        // onTap: () {},
                        title: const Text("Disable Notificatios"),
                        trailing: Switch(onChanged: (val) {}, value: true),
                      ),
                      //Divider(),
                      ListTile(
                          onTap: () {
                            Get.toNamed(AppRoute.reportview);
                          },
                          title: const Text("Reports"),
                          trailing: const Icon(Icons.report_outlined)),
                      ListTile(
                          onTap: () {
                            Get.toNamed(AppRoute.orderspending);
                          },
                          title: const Text("My account"),
                          trailing: const Icon(Icons.account_box)),
                      ListTile(
                        onTap: () {},
                        title: const Text("Address"),
                        trailing: const Icon(Icons.location_on_outlined),
                      ),

                      ListTile(
                        onTap: () {},
                        title: const Text("About us"),
                        trailing: const Icon(Icons.help_outline_rounded),
                      ),

                      ListTile(
                        onTap: () {},
                        title: const Text("Contact us"),
                        trailing: const Icon(Icons.phone_callback_outlined),
                      ),
                      ListTile(
                        onTap: () {
                          controller.logout();
                        },
                        title: const Text("Logout"),
                        trailing: const Icon(Icons.exit_to_app),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
/**Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.black,
                                      backgroundImage: NetworkImage(
                                        controller.serviceImage,
                                        //width: 70, height: 70
                                      )),
                                ), */