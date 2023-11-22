import 'package:flutter/material.dart';
import 'package:orop/core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20,
              color: AppColor.secondColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
