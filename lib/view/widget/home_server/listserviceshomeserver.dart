import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/productdetails_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/model/servicesmodel.dart';
import 'package:orop/linkapi.dart';

class ListServicesHomeServer extends GetView<HomeServerControllerImp> {
  const ListServicesHomeServer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 111,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.services.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Services(
                i: index,
                servicesModel:
                    ServicesModel.fromJson(controller.services[index]));
          },
        ));
  }
}

class Services extends GetView<HomeServerControllerImp> {
  final ServicesModel servicesModel;
  final int? i;
  const Services({
    Key? key,
    required this.servicesModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.servicesModel = servicesModel;
    return InkWell(
      onTap: () {
        controller.gotoCategories(
            controller.services, i!, servicesModel.servicesId!);
        // controller.changeSer(i!, servicesModel.servicesId!);
      },
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   color: AppColor.thirdColor,
            //   borderRadius: BorderRadius.circular(20),
            // ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imagestServices}/${servicesModel.servicesImage}",
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: AppColor.primaryColor),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
                // color: const Color.fromARGB(255, 103, 178, 240),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 90,
            child: Text("${servicesModel.servicesName}",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _getTextFontSize(servicesModel.servicesName!),
                )),
          ),
        ],
      ),
    );
  }

  // double _getTextFontSize(String text) {
  //   double defaultFontSize = 14.0; // حجم الخط الافتراضي
  //   double minFontSize = 12.0; // أدنى حجم للخط
  //   double maxFontSize = 15.0;
  //   final formatter = NumberFormat("#.##");
  //   final textSize = formatter.format((90 / text.length) * 3);
  //   final double calculatedFontSize = double.parse(textSize);

  //   if (calculatedFontSize < minFontSize) {
  //     return minFontSize;
  //   } else if (calculatedFontSize > maxFontSize) {
  //     return maxFontSize;
  //   } else {
  //     return calculatedFontSize;
  //   }
  // }
  double _getTextFontSize(String text) {
    double defaultFontSize = 14.0; // حجم الخط الافتراضي
    double maxFontSize = 20.0; // أقصى حجم للخط

    double fontSize = defaultFontSize;
    if (text.length > 12) {
      double availableSpace = 70.0;
      final double desiredFontSize = (availableSpace / text.length) * 1.5;
      fontSize = desiredFontSize.clamp(defaultFontSize, maxFontSize);
    }

    return fontSize;
  }
}








/*
SizedBox(
        height: 100,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: ((context, index) => const SizedBox(width: 10)),
          itemCount: controller.services.length,
          //scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Services(
                i: index,
                servicesModel:
                    ServicesModel.fromJson(controller.services[index]));
          },
        ));
*/