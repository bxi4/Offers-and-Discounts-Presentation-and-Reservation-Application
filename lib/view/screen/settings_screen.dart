import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/settings_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;
    SettingsController controller = Get.put(SettingsController());
    return WillPopScope(
        onWillPop: alertExitApp,
        child: ListView(
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                      height: Get.width / 3, color: AppColor.primaryColor),
                  // Container(
                  //     padding: const EdgeInsets.only(left: 340, bottom: 65),
                  //     child: const Icon(moonIcon, color: Colors.black)),
                  Positioned(
                      top: Get.width / 3.9,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage(AppImageAsset.win),
                        ),
                      )),
                ]),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      // onTap: () {},
                      title: const Text("Disable Notificatios"),
                      trailing: GetBuilder<SettingsController>(
                        init: SettingsController(),
                        builder: (controller) => Switch(onChanged: (val) {
                          controller.disableNotificationFunction();
                        // print(val);
                      }, value: controller.disableNotifications),
                      ),
                    ),
                    //Divider(),
                    GetBuilder<SettingsController>(
                      builder: (controller) => Visibility(
                        visible: controller.serviceDashboardVisibility,
                        child: ListTile(
                            onTap: () {
                              Get.toNamed(AppRoute.homescreenadmin);
                            },
                            title: const Text("Company dashboard"),
                            trailing: const Icon(Icons.dashboard_customize)),
                      ),
                    ),
                    ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.orderspending);
                        },
                        title: const Text("Orders"),
                        trailing: const Icon(Icons.card_travel)),
                    ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.ordersarchive);
                        },
                        title: const Text("Archive"),
                        trailing: const Icon(Icons.archive_outlined)),
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
                        Get.toNamed(AppRoute.upgradetoservice);
                      },
                      title: const Text("Upgrade to service"),
                      trailing: const Icon(Icons.upgrade_rounded),
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
        ));
  }
}
