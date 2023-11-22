import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/onboarding_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/static/static.dart';

class CustomSliderOnBording extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(height: 30),
                const Text("Welcome to the first time together",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: 18,
                    )),
                Image.asset(
                  onBoardingList[i].image!,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),

                const SizedBox(
                  height: 60,
                ),
                Text(
                  onBoardingList[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColor.black),
                ),

                //SizedBox(height: 80,),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(onBoardingList[i].body!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            height: 1,
                            color: AppColor.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14))),
              ],
            ));
  }
}
