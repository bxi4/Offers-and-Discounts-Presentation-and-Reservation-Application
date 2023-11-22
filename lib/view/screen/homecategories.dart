import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:orop/controller/categories_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/screen/home_server.dart';
import 'package:orop/view/widget/categories/customcardhome.dart';
import 'package:orop/view/widget/categories/customtitlehome.dart';
import 'package:orop/view/widget/categories/listproductshome.dart';
import 'package:orop/view/widget/customappbar.dart';
import 'package:orop/view/widget/categories/listcategorieshome.dart';

import '../../controller/home_server_controller.dart';

class HomeGategories extends StatelessWidget {
  const HomeGategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HomeServerControllerImp controllerImp = Get.put(HomeServerControllerImp());
    Get.put(CategoriesControllerImp());
    return Scaffold(
        body: GetBuilder<CategoriesControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
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
                var usersid = int.parse(
                    controller.myServices.sharedPreferences.getString("id")!);
                if (usersid == 21) {
                  sinUptoApp();
                } else {
                  Get.toNamed(AppRoute.notification);
                }
                // Get.delete<FavoriteController>();
              },
            ),
            HaindlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCardHome(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ElevatedButton.icon(   
                                  icon: controller.subscribeIcon,
                                  style: ElevatedButton. styleFrom(
                                    backgroundColor: controller.subscribeColor
                                  ),
                                  onPressed: () {
                                    controller.subbed ? controller.subscribeService() : controller.unSubscribeService();
                                    // controller.subbed = !controller.subbed;
                                  },
                                  label: Text("${controller.subscribeTitle}", style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                          CustomTitleHome(title: "Categories"),
                          ListCategoriesHome(),
                          SizedBox(height: 10),
                          CustomTitleHome(title: "Top Selling"),
                          SizedBox(height: 10),

                          ListProductsHomeCatecory(),
                          //const CustomTitleHome(title: "Offer"),
                          // const ListProductsHome(),
                        ],
                      ),
                  )
                  : ListProductsSearch(listdatamodel: controller.listdata),
              productTopSelling: controller.data.isEmpty,
            )
          ],
        ),
      ),
    ));
  }
}
