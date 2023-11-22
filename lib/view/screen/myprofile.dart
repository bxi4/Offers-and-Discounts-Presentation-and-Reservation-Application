import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/homescreen_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/widget/myprofile/custombodymyprofile.dart';
import 'package:orop/view/widget/myprofile/custombuttonmyprofile.dart';
import 'package:orop/view/widget/myprofile/customtitelicon.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message;
    //FavoriteController controller = Get.put(FavoriteController());
    CartController controllerCa = Get.put(CartController());
    HomeScreenControllerImp controller = Get.put(HomeScreenControllerImp());
    HomeServerControllerImp controllerImp = Get.put(HomeServerControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: HaindlingDataView(
            statusRequest: controllerImp.statusRequest,
            widget: Column(
              children: [
                Container(
                  height: 208,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 242, 248),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const CustomTitelIcon(
                        icon: Icons.search,
                        top: 10,
                        left: 10,
                      ),
                      const CustomTitelIcon(
                        icon: Icons.notifications,
                        top: 10,
                        left: 65,
                      ),
                      const IconButtonLog(
                        top: 10,
                        right: 8,
                      ),
                      const MyProf(),
                      const CustomText(
                        text: "   ,مرحبًا",
                        top: 55,
                        left: 320,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomButtonMyProfile(
                        text: "حجوزاتك",
                        myonTap: () {
                          Get.toNamed(AppRoute.cartscreen);
                        },
                        width: 150,
                        height: 50,
                        top: 100,
                        right: 10,
                        radius: 20,
                        fontSize: 20,
                        colors: const [Colors.grey, Colors.black],
                      ),
                      CustomButtonMyProfile(
                        text: "حسابك",
                        myonTap: () {},
                        width: 150,
                        height: 50,
                        top: 152,
                        right: 10,
                        radius: 20,
                        fontSize: 20,
                        colors: const [Colors.grey, Colors.black],
                      ),
                      CustomButtonMyProfile(
                        text: "حجز مرة اخرى",
                        myonTap: () {},
                        width: 150,
                        height: 50,
                        top: 100,
                        right: 250,
                        radius: 20,
                        fontSize: 16,
                        colors: const [AppColor.grey, Colors.black],
                      ),
                      CustomButtonMyProfile(
                        text: "ألمزيد",
                        myonTap: () {},
                        width: 150,
                        height: 50,
                        top: 152,
                        right: 250,
                        radius: 20,
                        fontSize: 20,
                        colors: const [Colors.grey, Colors.black],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Stack(
                  children: [
                    CustomBodyMyProfilee(
                      text: "حجوزاتك",
                      onPressed: () {
                        Get.toNamed(AppRoute.cartscreen);
                      },
                      padding: const EdgeInsets.only(
                          left: 280, bottom: 100, right: 20),
                    ),
                    GetBuilder<CartController>(
                      builder: (controllerCa) =>
                          controllerCa.message = controllerCa.data.isEmpty
                              ? const TextBody(
                                  text: ",مرحبًا",
                                  padding1: EdgeInsets.only(top: 65, left: 330),
                                  text1: ".ليس لديك طلبات حديثة",
                                  padding: EdgeInsets.only(top: 65, left: 140),
                                )
                              : const TextBody(
                                  text: ",مرحبًا",
                                  padding1: EdgeInsets.only(top: 65, left: 330),
                                  text1: ".تفضل لمعرفة حجوزاتك",
                                  padding: EdgeInsets.only(top: 65, left: 140),
                                ),
                    ),
                    CustomButtonMyProfile(
                      text: "العودة الى الصفحة الرئيسية",
                      myonTap: () {
                        controller.currentpage != controller.changPage(0);
                      },
                      width: 380,
                      top: 100,
                      left: 10,
                      radius: 8,
                      fontSize: 20,
                      colors: const [Colors.black, Colors.blue],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Stack(
                  children: [
                    const CustomBodyMyProfilee(
                      text: "حجز مرة اخرى",
                      padding:
                          EdgeInsets.only(left: 235, bottom: 100, right: 20),
                    ),
                    const TextBody(
                      text: "شاهد ما يعيد الاخرون",
                      padding1: EdgeInsets.only(top: 65, left: 225),
                      text1: ".طلبة عند الحجز مرة اخرى",
                      padding: EdgeInsets.only(top: 65, left: 25),
                    ),
                    CustomButtonMyProfile(
                      text: "زيارة حجز مرة أخرى",
                      myonTap: () {
                        Get.offNamed(AppRoute.homeServer);
                      },
                      width: 380,
                      top: 100,
                      left: 10,
                      radius: 8,
                      fontSize: 20,
                      colors: const [Colors.black, Colors.blue],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Stack(
                  children: [
                    const CustomBodyMyProfilee(
                      text: " أحدث المنتجات ",
                      padding:
                          EdgeInsets.only(left: 220, bottom: 100, right: 20),
                    ),
                    const TextBody(
                      text: "",
                      text1: ".شاهد احدث المنتجات من هنا",
                      padding: EdgeInsets.only(top: 65, left: 165),
                    ),
                    CustomButtonMyProfile(
                      text: "ألاطلإع على أحدث المنتجات",
                      myonTap: () {
                        Get.offNamed(AppRoute.homeServer);
                      },
                      width: 380,
                      top: 100,
                      left: 10,
                      radius: 8,
                      fontSize: 20,
                      colors: const [Colors.black, Colors.blue],
                    ),
                  ],
                ),
              ],
            ),
          )),
    ));
  }
}
