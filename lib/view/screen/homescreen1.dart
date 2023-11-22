import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/screen/home_server.dart';
import 'package:orop/view/widget/home_server/gridviewserverbody1.dart';
import '../../controller/favorite_controller.dart';

class HomeScreen1 extends GetView<HomeServerControllerImp> {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeServerControllerImp());
    Get.put(FavoriteController());
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 60,
          elevation: 0.0,
          title: const Center(child: Text("Home")),
          backgroundColor: AppColor.primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.notification);
                    },
                    icon: const Icon(Icons.notifications_active_outlined))),
          ],
          leading: IconButton(
              onPressed: () {
                Get.to(() => const Search());
                controller.searchClear();
              },
              icon: const Icon(Icons.search)),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<HomeServerControllerImp>(
                builder: ((controller) => HaindlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      // margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: AppColor.primaryColor,
                            ),
                            child: Container(
                              width: double.infinity,
                              //height: 60,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Container(
                                // margin: const EdgeInsets.only(top: 12, left: 128),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 45, bottom: 15),
                                      height: 35,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                          color: AppColor.thirdColor,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(30),
                                            topLeft: Radius.circular(20),
                                          )),
                                      child: Center(
                                        child: Text(
                                          "مفتوح",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "اوقات الدوام من 1 الظهر الى 2 بعد منتصف الليل ",
                                      style: TextStyle( 
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3.5),
                          Container(
                            color: Colors.white12.withOpacity(0.5),
                            height: 620,
                            //width: 500,
                            child: const GridViewServerBody1(),
                          ),
                        ],
                      ),
                    )
                    // : ListProductsSearch(listdatamodel: controller.listdata),
                    )))));
  }
}
/** 
                  
                  
                  CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      expandedHeight: 350,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CustomImageAds(),
                      ),
                      title: const CustomTitleHome(title: "Companies"),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      return SizedBox(height: 385, child: GridViewServerBody());
                    }))
                  ],
                )*/
