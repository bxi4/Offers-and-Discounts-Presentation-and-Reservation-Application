import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CustomButtonMyProfile extends StatelessWidget {
  final String text;
  final void Function()? myonTap;
  final double? width;
  final double? top;
  final double? left;
  final double? right;
  final double? height;
  final double radius;
  final double? fontSize;
  final List<Color> colors;
  const CustomButtonMyProfile(
      {Key? key,
      required this.text,
      required this.myonTap,
      this.width,
      this.top,
      this.left,
      this.right,
      this.height,
      required this.radius,
      required this.colors,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: SizedBox(
        width: width,
        height: height,
        child: OutlineGradientButton(
          // ignore: sort_child_properties_last
          child: Center(
            child: Text(text,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600)),
          ),
          onTap: myonTap,
          gradient: LinearGradient(
            colors: colors,
          ),
          strokeWidth: 4,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          radius: Radius.circular(radius),
        ),
      ),
    );
  }
}

class TextBody extends StatelessWidget {
  final String text;
  final String text1;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? padding1;
  const TextBody({
    Key? key,
    required this.text,
    required this.text1,
    this.padding,
    this.padding1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controllerCa = Get.put(CartController());
    return Stack(children: [
      Container(
        padding: padding1,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: padding,
        child: Text(
          text1,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}

class IconButtonLog extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;

  const IconButtonLog({
    Key? key,
    this.top,
    this.left,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        right: right,
        left: left,
        child: SizedBox(
          child: IconButton(
              onPressed: () {
                Get.offNamed(AppRoute.login);
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
                color: AppColor.bColor,
              )),
        ));
  }
}
