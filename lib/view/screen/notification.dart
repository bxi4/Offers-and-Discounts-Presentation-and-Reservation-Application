import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:orop/controller/notification_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      body: GetBuilder<NotificationController>(
          builder: (controller) => HaindlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(right: 140),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.offNamed(AppRoute.homeServer);
                                  },
                                  icon: const Icon(Icons.arrow_back,
                                      color: AppColor.primaryColor)),
                              const Text(
                                "Notification",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...List.generate(
                          controller.data.length,
                          (index) => Container(
                                margin: const EdgeInsets.only(top: 4),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Stack(
                                  children: [
                                    ListTile(
                                      //dense: true,
                                      title: Text(controller.data[index]['notification_read']),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 13),
                                          Text(controller.data[index]
                                              ['notification_body']),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "CO: ${controller.data[index]['notification_sername']}",
                                            textAlign: TextAlign.center,
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 60),
                                          Text(
                                            Jiffy(
                                                    controller.data[index][
                                                        'notification_datetime'],
                                                    "yyyy-MM-dd")
                                                .fromNow(),
                                            style: const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                    ],
                  ),
                ),
              )),
    );
  }
}
