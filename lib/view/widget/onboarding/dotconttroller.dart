import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orop/controller/onboarding_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/static/static.dart';

class CustomDotControllerBording extends StatelessWidget {
  const CustomDotControllerBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
              ],
            ));
  }
}
