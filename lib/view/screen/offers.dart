import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/offers_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/screen/home_server.dart';
import 'package:orop/view/widget/customappbar.dart';
import 'package:orop/view/widget/offers/customitemsoffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerfav = Get.put(FavoriteController());
    return WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<OffersController>(
            builder: ((controller) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      CustomAppBar(
                        mycontroller: controller.search!,
                        titleappbar: "Find Product",
                        // onPressedIcon: () {},
                        onPressedSearch: () {
                          controller.onSearchItems();
                        },
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                        onPressedIcon: () {
                          var usersid = int.parse(controller
                              .myServices.sharedPreferences
                              .getString("id")!);
                          if (usersid == 21) {
                            sinUptoApp();
                          } else {
                            Get.toNamed(AppRoute.notification);
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      !controller.isSearch
                          ? HaindlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, index) {
                                    controllerfav.isFavorite[
                                            controller.data[index].productsId] =
                                        controller.data[index].favorite;
                                    return CustomListItemsOffer(
                                        i: index,
                                        productsModel: controller.data[index]);
                                  }))
                          : ListProductsSearch(
                              listdatamodel: controller.listdata),
                    ],
                  ),
                ))));
  }
}
