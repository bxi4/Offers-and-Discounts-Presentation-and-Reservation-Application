import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orop/controller/categories_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/linkapi.dart';

class ListProductsHomeCatecory extends GetView<CategoriesControllerImp> {
  const ListProductsHomeCatecory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(ProductControllerImp());
    Get.put(CategoriesControllerImp());
    return SizedBox(
      height: 140,
      child: controller.datapts.isEmpty
          ? Center(
              child:
                  Lottie.asset(AppImageAsset.nothing, width: 250, height: 250))
          : ListView.builder(
              itemCount: controller.datapts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return ProductHome(
                    i: i,
                    productsModel:
                        ProductsModel.fromJson(controller.datapts[i]));
              }),
    );
  }
}

class ProductHome extends GetView<CategoriesControllerImp> {
  final ProductsModel productsModel;
  final int? i;
  const ProductHome({
    Key? key,
    required this.productsModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(CategoriesControllerImp());
    HomeServerControllerImp controller1 = Get.put(HomeServerControllerImp());
    return InkWell(
      onTap: (() {
        controller1.gotoPageProductDetails1(productsModel, i!);
      }),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imagestProduct}/${productsModel.productsImage}",
              height: 100,
              width: 150,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: AppColor.grey),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.black26,
              color: const Color.fromARGB(255, 96, 128, 153).withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              top: 10,
              child: Text(
                "${productsModel.productsName}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
    );
  }
}
