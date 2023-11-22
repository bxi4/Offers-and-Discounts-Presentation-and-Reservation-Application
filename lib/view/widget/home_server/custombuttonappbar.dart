import 'package:flutter/material.dart';
import 'package:orop/core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  //final String textbutton;
  final IconData icondata;
  final void Function()? onPressedIcon;
  final bool? active;
  const CustomButtonAppBar({
    Key? key,
   // required this.textbutton,
    required this.icondata,
    this.onPressed,
    required this.active,
    this.onPressedIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //IconButton(onPressed: onPressedIcon,icon: Icon(icondata,color: active == true ? AppColor.primaryColor : AppColor.grey2)),
          Icon(icondata,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // const SizedBox(width: 70),
          // Text(
          //   textbutton,
          //   style: TextStyle(
          //       color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // ),
        ],
      ),
    );
  }
}
