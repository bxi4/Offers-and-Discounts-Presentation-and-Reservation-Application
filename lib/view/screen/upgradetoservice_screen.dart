import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/upgradetoservice_controller.dart';

class UpgradeToServiceScreen extends StatelessWidget {
  const UpgradeToServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String readMeText =
        "By upgrading your plan you will get all company privllegs and abusing this privllegs may cause your account banned so please use to for business profits";

    return GetBuilder<UpdgradeToSeriveController>(
      init: UpdgradeToSeriveController(context: context),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Upgrade plans"),
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: CarouselSlider(
                    // disableGesture: true,
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.60,
                        aspectRatio: 3.0,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        enableInfiniteScroll: false,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                    items: controller.items,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      readMeText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, height: 1.5),
                    )),
              ],
            ));
      },
    );
  }
}
