import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/view/screen/upgradetoservice_screen1.dart';

class CustomButtonServicePlan extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  const CustomButtonServicePlan({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        // padding: const EdgeInsets.symmetric(horizontal: 145, vertical: 50),
        textColor: Colors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColor.primaryColor,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.black,
            fontSize: 15,
          ),
        ));
  }
}
