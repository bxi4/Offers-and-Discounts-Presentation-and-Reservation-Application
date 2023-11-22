import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:orop/controller/categories_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/model/categoriesmodel.dart';
import 'package:orop/data/model/servicesmodel.dart';
import 'package:orop/linkapi.dart';

class ListCategoriesHome extends GetView<CategoriesControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
    return SizedBox(
        height: 100,
        child: ListView.separated(
          separatorBuilder: ((context, index) => const SizedBox(width: 10)),
          itemCount: controller.data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.data[index]),
                servicesModel: ServicesModel.fromJson(controller.data[index]));
          },
        ));
  }
}

class Categories extends GetView<CategoriesControllerImp> {
  final ServicesModel servicesModel;
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.i,
    required this.servicesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
    HomeServerControllerImp controll = Get.put(HomeServerControllerImp());
    controller.servicesModel = servicesModel;
    controller.categoriesModel = categoriesModel;
    return InkWell(
        onTap: () {
          controll.gotoItems(controll.categories, i!,
              categoriesModel.categoriesId!, servicesModel.servicesId!);
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: 70,
              child: controller.loadImage(
                  "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}"),
              //  SvgPicture.network(
              //   "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}",
              //   color: const Color.fromARGB(255, 103, 178, 240),
              // ),
            ),
            const SizedBox(height: 10),
            Text("${categoriesModel.categoriesName}")
          ],
        ));
  }
}
