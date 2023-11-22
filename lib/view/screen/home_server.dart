import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/notification_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/linkapi.dart';
import 'package:orop/view/widget/customappbar.dart';
import 'package:orop/view/widget/home_server/listproductshome.dart';

class HomeServer extends StatelessWidget {
  const HomeServer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controllerntf = Get.put(NotificationController());
    Get.put(HomeServerControllerImp());
    Get.put(FavoriteController());
    return WillPopScope(
      onWillPop: alertExitApp,
      child: GetBuilder<HomeServerControllerImp>(
          builder: ((controller) => Container(
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(children: [
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
                      var usersid = int.parse(controller
                          .myServices.sharedPreferences
                          .getString("id")!);
                      if (usersid == 21) {
                        sinUptoApp();
                      } else {
                        controllerntf.notificationRead();
                      }
                      // Get.toNamed(AppRoute.cartscreen);
                      // Get.delete<NotificationController>();
                    },
                  ),
                  HaindlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: const [
                                SizedBox(
                                    //  width: double.infinity,
                                    height: 680,
                                    child: ListProductsHome()),
                              ],
                            )
                          : ListProductsSearch(
                              listdatamodel: controller.listdata))
                ]),
              ))),
    );
  }
}

class ListProductsSearch extends GetView<HomeServerControllerImp> {
  final List<ProductsModel> listdatamodel;
  const ListProductsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.gotoPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestProduct}/${listdatamodel[index].productsImage}")),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "     CO: ${listdatamodel[index].servicesName!}",
                            style: TextStyle(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                          ListTile(
                            title: Text(listdatamodel[index].productsName!),
                            subtitle:
                                Text(listdatamodel[index].categoriesName!),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
        });
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeServerControllerImp());
    Get.put(FavoriteController());
    return GetBuilder<HomeServerControllerImp>(
        builder: ((controller) => Scaffold(
              body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
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
                        // Get.delete<NotificationController>();
                      },
                    ),
                    HaindlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: ListProductsSearch(
                            listdatamodel: controller.listdata))
                  ],
                ),
              ),
            )));
  }
}
