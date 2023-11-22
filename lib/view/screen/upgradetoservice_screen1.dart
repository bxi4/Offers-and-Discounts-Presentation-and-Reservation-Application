import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/upgradetoservice_controller.dart';
import 'package:orop/controller/upgradetoservice_controller1.dart';
import 'package:orop/view/widget/upgrade_to_service/custombutton.dart';
import 'package:orop/view/widget/upgrade_to_service/textformfield.dart';

class UpgradeToServiceScreen1 extends StatelessWidget {
  final String servicePlanID;
  final String servicePlanName;
  final String servicePlanDesc;
  final String servicePlanPrice;
  const UpgradeToServiceScreen1(
      {super.key,
      required this.servicePlanID,
      required this.servicePlanName,
      required this.servicePlanDesc,
      required this.servicePlanPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upgrade plans"),
      ),
      body: GetBuilder<UpdgradeToSeriveController1>(
          init: UpdgradeToSeriveController1(),
          builder: (controller) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("You selected $servicePlanName"),
                    Text("With $servicePlanPrice YER"),
                    CustomTextFormFieldText(hinTextForm: "Service name", controller: controller.serviceName),
                    CustomTextFormFieldText(
                        hinTextForm: "Service Address", controller: controller.serviceAddress),
                    CustomTextFormFieldText(
                        hinTextForm: "Service Description", controller: controller.serviceDesc),
                    CustomButtonServicePlan(
                      buttonText: "Order",
                      onPressed: () {
                        controller.sendData(servicePlanID);
                      },
                    ),
                  ],
                ),
              )),
    );
  }
}
