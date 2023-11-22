import 'package:flutter/material.dart';
import 'package:orop/core/constant/color.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
