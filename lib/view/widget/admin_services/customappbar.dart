import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/products/view_controller.dart';

PreferredSizeWidget? CustomAppBarAdmin2 (String appBarName) {
  return AppBar(
          actions: [
            GetBuilder<AdminServicesProductsController>(
                init: AdminServicesProductsController(),
                builder: (controller) => Container(
                      margin: EdgeInsets.only(right: 15),
                      child: InkWell(
                        onTap: () {
                          controller.openOrders();
                        },
                        child: Badge(
                          showBadge: controller.visibileBadge,
                          position: BadgePosition.topEnd(top: 0),
                          child: const Icon(Icons.notifications_on_sharp),
                          badgeContent: Text(
                            "${controller.notifcationBadge}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ))
            // Padding(
            //     padding: const EdgeInsets.only(right: 20.0),
            //     child: GestureDetector(
            //         onTap: () {
            //           controller.openOrders();
            //         },
            //         child: const Icon(Icons.add_shopping_cart))),
          ],
          title: Text(appBarName),
        );

}