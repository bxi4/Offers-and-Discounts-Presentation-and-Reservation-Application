import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/products_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/linkapi.dart';
import 'package:orop/view/widget/productdetails/productdetailsitems.dart';
import '../../controller/browsercheck_controller.dart';
import '../../controller/productdetails_controller.dart';

class ProductDetails extends GetView<ProductDetailsControllerImp> {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ProductControllerImp controllerImp = Get.put(ProductControllerImp());
    // CartController controllerCrat = Get.put(CartController());
    // ProductControllerImp cc = Get.put(ProductControllerImp());
    //HomeServerControllerImp c = Get.put(HomeServerControllerImp());
    CommentsController controllerc = Get.put(CommentsController());
    BrowsersCheck controllerCheck = Get.put(BrowsersCheck());
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    bool i;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 240, 243, 243),
            //backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Center(
                child: Text(
              "Details Product",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.offNamed(AppRoute.product);
                Get.delete<ProductControllerImp>();
              },
            ),
            actions: [
              // if()
              GetBuilder<FavoriteController>(
                  builder: (controlerF) => IconButton(
                      onPressed: () {
                        if (controllerCheck.usersid.value == 21) {
                          sinUptoApp();
                        } else {
                          if (controlerF.isFavorite[
                                  controller.productsModel.productsId] ==
                              "1") {
                            controlerF.setFavorite(
                                controller.productsModel.productsId, "0");
                            controlerF.removeFavorite(
                                controller.productsModel.productsId!,
                                controller.productsModel.servicesId!);
                          } else {
                            controlerF.setFavorite(
                                controller.productsModel.productsId, "1");
                            controlerF.addFavorite(
                                controller.productsModel.productsId!,
                                controller.productsModel.servicesId!);
                          }
                        }
                      },
                      icon: Icon(
                        controlerF.isFavorite[
                                    controller.productsModel.productsId] ==
                                "1"
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColor.primaryColor,
                      )))
            ]),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HaindlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Hero(
                              tag: "${controller.productsModel.productsId}",
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imagestProduct}/${controller.productsModel.productsImage}",
                                width: 300,
                                height: 280,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      //top: 0.0,
                                      bottom: 16.0,
                                      left: 16.0,
                                      right: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              height: 55,
                                              width: 60,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: controller.image(
                                                  "${AppLink.imagestServices}/${controller.productsModel.servicesImage}")
                                              //  CircleAvatar(
                                              //   radius: 20,
                                              //   backgroundColor: Colors.black,
                                              //   backgroundImage: NetworkImage(
                                              //     "${AppLink.imagestServices}/${controller.productsModel.servicesImage}",
                                              //   ),
                                              // ),
                                              ),
                                          const SizedBox(width: 8),
                                          Text(
                                            "${controller.productsModel.servicesName}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: AppColor.bColor,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${controller.productsModel.productsName}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                  Get.toNamed(AppRoute.comment);
                                                // Get.delete<
                                                //     CommentsController>();
                                              },
                                              child: Column(
                                                children: const [
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Icon(
                                                      Icons
                                                          .mode_comment_outlined,
                                                      color: AppColor
                                                          .primaryColor),
                                                  Text(
                                                    "تعليق",
                                                    textAlign: TextAlign.center,
                                                    // style: TextStyle(color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                          const SizedBox(width: 16),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 14),
                                            decoration: BoxDecoration(
                                              color: AppColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "${controller.productsModel.productsPriceDiscount} \YER",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "${controller.productsModel.productsDesc} ${controller.productsModel.productsDesc} ${controller.productsModel.productsDesc}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(3.5),
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        decoration: const BoxDecoration(
                            //color: Colors.white,
                            color: Color.fromARGB(255, 224, 236, 245),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            )),
                        //
                        child: const ProductDetailsItems(),
                      ),
                      if (controller.productsModel.productsDiscount != "0")
                        Positioned(
                            top: 4,
                            left: 4,
                            child: Image.asset(
                              AppImageAsset.saleOne,
                              width: 50,
                            )),
                    ],
                  ),
                )));
  }
}
