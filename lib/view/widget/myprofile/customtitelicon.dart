import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';

class CustomTitelIcon extends StatelessWidget {
  final IconData? icon;
  final double? top;
  final double? left;
  final double? right;
  const CustomTitelIcon(
      {Key? key, required this.icon, this.top, this.left, this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        minRadius: 25,
        child: Icon(
          icon!,
          color: Colors.black,
          size: 19,
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final String text;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      this.top,
      this.left,
      this.right,
      required this.text,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, fontWeight: fontWeight, color: Colors.black),
      ),
    );
  }
}

class MyProf extends GetView<HomeServerControllerImp> {
  const MyProf({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeServerControllerImp());
    int i = controller.username!.length;
    if (i >= 60) {
      return Positioned(
          top: 60,
          left: 120,
          child: Text(
            controller.username!,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ));
    } else {
      return Positioned(
          top: 60,
          left: 230,
          child: Text(
            controller.username!,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ));
    }
  }
}
