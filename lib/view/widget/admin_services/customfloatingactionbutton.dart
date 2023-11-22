import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/constant/routes.dart';

Widget customFloatingActionButton() {
  return FloatingActionButton(
    heroTag: "button1",
    onPressed: () {
      Get.toNamed(AppRoute.homeServer);
    },
    child: const Icon(Icons.explore),
  );
}
