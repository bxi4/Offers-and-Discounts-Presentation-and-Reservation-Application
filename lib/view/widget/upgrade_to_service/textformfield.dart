import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/controller/upgradetoservice_controller1.dart';
import 'package:orop/core/constant/color.dart';

class CustomTextFormFieldText extends StatelessWidget {
  final String hinTextForm;
  final TextEditingController controller;
  // final String initialValue;
  const CustomTextFormFieldText({Key? key, required this.hinTextForm, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        //initialValue: initialValue,
        //keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          hintText: hinTextForm,
          hintStyle: const TextStyle(
            color: AppColor.grey,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(horizontal: 35),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: const BorderSide(style: BorderStyle.none)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: const BorderSide(style: BorderStyle.none)),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
