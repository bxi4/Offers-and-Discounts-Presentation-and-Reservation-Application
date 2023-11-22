import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/products_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/linkapi.dart';

class CustomListProducts extends GetView<ProductControllerImp> {
  final ProductsModel productsModel;
  // final int? i;
  const CustomListProducts({Key? key, required this.productsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeServerControllerImp v = Get.put(HomeServerControllerImp());
    // controller.i = i!;
    // controller.m = productsModel.servicesImage;
    // controller.img = productsModel.productsId;
    v.m = productsModel;
    var usersid =
        int.parse(controller.myServices.sharedPreferences.getString("id")!);
    return InkWell(
      onTap: () {
        controller.gotoPageProductDetails(productsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${productsModel.productsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagestProduct}/${productsModel.productsImage!}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("${productsModel.productsName}",
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Rating 3.5",
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 17,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${productsModel.productsPriceDiscount} \YER",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (usersid == 21) {
                                  sinUptoApp();
                                } else {
                                  if (controller.isFavorite[
                                          productsModel.productsId] ==
                                      "1") {
                                    controller.setFavorite(
                                        productsModel.productsId, "0");
                                    controller.removeFavorite(
                                        productsModel.productsId!,
                                        productsModel.tabledetailsServiId!);
                                  } else {
                                    controller.setFavorite(
                                        productsModel.productsId, "1");
                                    controller.addFavorite(
                                        productsModel.productsId!,
                                        productsModel.tabledetailsServiId!);
                                  }
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[
                                            productsModel.productsId] ==
                                        "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              )))
                    ],
                  )
                ],
              ),
            ),
            if (productsModel.productsDiscount != "0")
              Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(
                    AppImageAsset.saleOne,
                    width: 40,
                  ))
          ],
        ),
      ),
    );
  }
}
