import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/data/model/myfavoritemodel.dart';
import 'package:orop/linkapi.dart';

class CustomListFavoriteProduct extends StatelessWidget {
  final MyFavoriteModel myFavoriteModel;
  const CustomListFavoriteProduct({Key? key, required this.myFavoriteModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ProductControllerImp controllerpro = Get.put(ProductControllerImp());
    FavoriteController controller = Get.put(FavoriteController());
    return InkWell(
        onTap: () {},
        child: Card(
          child: GetBuilder<FavoriteController>(
              builder: (controller) => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Hero(
                              tag: "${myFavoriteModel.productsId}",
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imagestProduct}/${myFavoriteModel.productsImage!}",
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("${myFavoriteModel.productsName}",
                                style: const TextStyle(
                                    color: AppColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 7),
                            Text("${myFavoriteModel.servicesId}",
                                style: const TextStyle(
                                    color: AppColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 7),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
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
                                Text(
                                    "${myFavoriteModel.productsPriceDiscount} YER",
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sans")),
                                IconButton(
                                    onPressed: () {
                                      controller.deleteFromFavorite(
                                          myFavoriteModel.favoriteId!);
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: AppColor.primaryColor,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      if (myFavoriteModel.productsDiscount != "0")
                        Positioned(
                            top: 4,
                            left: 4,
                            child: Image.asset(
                              AppImageAsset.saleOne,
                              width: 35,
                            ))
                    ],
                  )),
        ));
  }
}
