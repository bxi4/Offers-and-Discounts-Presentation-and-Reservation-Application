import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/core/constant/color.dart';

class TextFormFieldText extends StatelessWidget {
  final String hinTextForm;
  final void Function()? onPressed;
  // final String initialValue;
  const TextFormFieldText(
      {Key? key, required this.hinTextForm, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommentsController controller = Get.put(CommentsController());
    return TextFormField(
      //initialValue: initialValue,
      //keyboardType: TextInputType.text,
      controller: controller.name,
      decoration: InputDecoration(
        hintText: hinTextForm,
        hintStyle: const TextStyle(
          color: AppColor.grey,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: IconButton(
            icon: const Icon(
              Icons.send,
              //color: Colors.blue,
            ),
            onPressed: onPressed),
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
    );
  }
}
