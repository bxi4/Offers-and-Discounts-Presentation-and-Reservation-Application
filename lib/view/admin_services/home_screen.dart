import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/service_controller.dart';
import 'package:orop/controller/adminservices/servicescreen_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/view/widget/admin_services/home/customappbarservice.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SettingsController controller = Get.put(SettingsController());
    // Get.put(ServiceScreenDrawerController());
    // Get.put(FavoriteController());
    Get.put(ServiceScreenControllerImp());
    Get.put(ServiceScreenDrawerController());
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              GetBuilder<ServiceScreenDrawerController>(
                  init: ServiceScreenDrawerController(),
                  builder: (controller) {
                    return Container(
                      color: const Color.fromRGBO(68, 138, 255, 1),
                      height: 150,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(controller.serviceImage,
                              width: 70, height: 70),
                          Text(
                            "${controller.daysLeftNull} days left",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: LinearPercentIndicator(
                              backgroundColor: Colors.black,
                              progressColor: Colors.green,
                              animation: true,
                              percent: controller.miniLeftDate,
                              lineHeight: 5,
                              barRadius: const Radius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.adminservicesproductsadd);
              //Get.delete<CartController>();
            },
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottonAppBarService(),
        body: GetBuilder<ServiceScreenControllerImp>(builder: ((controllerImp) {
          return controllerImp.listPage.elementAt(controllerImp.currentpage);
        })));
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:orop/controller/settings_controller.dart';
// import 'package:orop/core/constant/imageasset.dart';
// import 'package:orop/core/constant/routes.dart';
// import 'package:orop/view/widget/admin_services/home/cardadmin.dart';

// class HomeScreenAdmin extends StatelessWidget {
//   const HomeScreenAdmin({Key? key}) : super(key: key);
//   // ServiceController controller = Get.put(ServiceController());

//   @override
//   Widget build(BuildContext context) {
//     SettingsController controller = Get.put(SettingsController());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text("Home")),
//       ),
//       body: ListView(
//         children: [
//           GridView(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3, mainAxisExtent: 150),
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             //crossAxisCount: 2,
//             children: [
//               CardAdminHome(
//                   url: AppImageAsset.productsView,
//                   title: "Product",
//                   onClick: () {
//                     Get.toNamed(AppRoute.adminservicesproductsview);
//                   }),
//               CardAdminHome(
//                   url: AppImageAsset.ordersView,
//                   title: "Orders",
//                   onClick: () {
//                     Get.toNamed(AppRoute.adminservicesorderscreen);
//                   }),
//               CardAdminHome(
//                   url: AppImageAsset.usersView, title: "Users", onClick: () {}),
//               CardAdminHome(
//                   url: AppImageAsset.messageView,
//                   title: "Message",
//                   onClick: () {}),
//               CardAdminHome(
//                   url: AppImageAsset.reportView,
//                   title: "Report",
//                   onClick: () {}),
//               CardAdminHome(
//                   url: AppImageAsset.notificationView,
//                   title: "Notification",
//                   onClick: () {}),
//               CardAdminHome(
//                   url: AppImageAsset.loguotView,
//                   title: "loguot",
//                   onClick: () {
//                     controller.logout();
//                   }),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
