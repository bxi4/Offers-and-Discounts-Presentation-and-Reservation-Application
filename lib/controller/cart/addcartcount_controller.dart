// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:orop/controller/cart/cart_controller.dart';
// import 'package:orop/core/class/statusrequest.dart';
// import 'package:orop/core/functions/handlingdatacontroller.dart';
// import 'package:orop/core/services/services.dart';
// import 'package:orop/data/datasource/remote/cart_data.dart';
// import 'package:orop/data/model/cardmodel.dart';

// class AddCartCountController extends GetxController {
//   CardData cardData = CardData(Get.find());
//   List<CartModel> data = [];
//   MyServices myServices = Get.find();
//   late StatusRequest statusRequest;

//   final RxBool isSelected = false.obs;
//   //RxMap<String, String> isCount = RxMap<String, String>();
//   // CartController controller = Get.put(CartController());
//   Map isCount = {};
//   var count;
//   setFavorite(id, val) {
//     isCount[id];
//     print("=====-=-=- $isCount");
//     update();
//   }

//   addCarCount(String serid, String catid, String prodid) async {
//     //data.clear();
//     statusRequest = StatusRequest.loding;
//     var response = await cardData.addCartCount(
//         myServices.sharedPreferences.getString("id")!, serid, catid, prodid);
//     print("========================== Controller $response ");
//     statusRequest = handlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         count;
//         // controller.myCart();
//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text(" تم اضافة المنتج الى المفضلة"));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   removeCarCount(String serid, String catid, String prodid) async {
//     //data.clear();
//     statusRequest = StatusRequest.loding;
//     var response = await cardData.removeCartCount(
//         myServices.sharedPreferences.getString("id")!, serid, catid, prodid);
//     print("========================== Controller $response ");
//     statusRequest = handlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         count;
//         Get.rawSnackbar(
//             title: "اشعار",
//             messageText: const Text(" تم حذف المنتج من المفضلة"));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
// }
