import 'package:flutter/material.dart';
import 'package:orop/core/constant/color.dart';

class CardPaymentMethod extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethod(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isActive == true ? AppColor.secondColor : AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isActive == true
                ? Colors.white
                : const Color.fromARGB(255, 73, 160, 211),
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
