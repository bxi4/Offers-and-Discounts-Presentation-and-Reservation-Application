import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/notification_controller.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      this.onPressedIcon,
      this.onChanged,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 0;
    NotificationController controller1 = Get.put(NotificationController());
    HomeServerControllerImp controller = Get.put(HomeServerControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: mycontroller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: onPressedSearch),
                suffixIcon: controller.search!.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          controller.searchClear();
                        },
                        icon: const Icon(
                          Icons.close,
                        ))
                    : null,
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: const Color.fromARGB(255, 229, 236, 238),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 229, 236, 238),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child:
                  //  IconButton(
                  //   onPressed: onPressedIcon,
                  // icon: Icon(
                  //   Icons.notifications_active_outlined,
                  //   size: 30,
                  //   color: Colors.grey[600],
                  // ),
                  // ),
                  //if(controller1)

                  GetBuilder<HomeServerControllerImp>(
                      builder: (controller) => Column(
                            children: [
                              controller.isNotificationRead
                                  ? Badge(
                                      // position: BadgePosition.topEnd(top: 0, end: 8),
                                      position: BadgePosition.bottomEnd(
                                          bottom: 33, end: 3),
                                      //padding: EdgeInsets.only(bottom: 1, left: 30),
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      animationType: BadgeAnimationType.slide,
                                      badgeContent: Text(
                                        controller1.countitems.toString(),
                                        //controller1.countitems.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),

                                      child: IconButton(
                                        onPressed: onPressedIcon,
                                        icon: Icon(
                                          Icons.notifications_active_outlined,
                                          size: 30,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: onPressedIcon,
                                      icon: Icon(
                                        Icons.notifications_active_outlined,
                                        size: 30,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                            ],
                          )))
        ],
      ),
    );
  }
}

class CustomAppSearch extends StatelessWidget {
  final String titleappbar;
  //final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppSearch(
      {Key? key,
      required this.titleappbar,
      // required this.onPressedIcon,
      required this.onPressedSearch,
      required this.onChanged,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeServerControllerImp controller = Get.put(HomeServerControllerImp());
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: mycontroller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: onPressedSearch),
                suffixIcon: controller.search!.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          controller.searchClear();
                        },
                        icon: const Icon(
                          Icons.close,
                        ))
                    : null,
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: const Color.fromARGB(255, 229, 236, 238),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
