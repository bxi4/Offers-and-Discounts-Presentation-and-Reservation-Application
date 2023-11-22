import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/screen/home_server.dart';
import 'package:orop/view/widget/customappbar.dart';
import 'package:orop/view/widget/myfavorite/customlistfavoriteproduct.dart';

class MyFavorit extends StatelessWidget {
  const MyFavorit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: WillPopScope(
              onWillPop: alertExitApp,
              child: GetBuilder<FavoriteController>(
                  builder: ((controller) => ListView(
                        children: [
                          CustomAppBar(
                            mycontroller: controller.search!,
                            titleappbar: "Search",
                            onPressedSearch: () {
                              controller.onSearchItems();
                            },
                            onChanged: (val) {
                              controller.checkSearch(val);
                            },
                            onPressedIcon: () {
                              Get.toNamed(AppRoute.notification);
                              Get.delete<FavoriteController>();
                            },
                          ),
                          HaindlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: !controller.isSearch
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller.data.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.7),
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return CustomListFavoriteProduct(
                                            myFavoriteModel:
                                                controller.data[index]);
                                      },
                                    )
                                  : ListProductsSearch(
                                      listdatamodel: controller.listdata))
                        ],
                      ))))),
    );
  }
}
