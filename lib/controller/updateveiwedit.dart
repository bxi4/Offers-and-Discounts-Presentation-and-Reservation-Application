// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:orop/controller/comments_controller.dart';
// import 'package:orop/controller/productdetails_controller.dart';
// import 'package:orop/core/class/statusrequest.dart';
// import 'package:orop/core/constant/routes.dart';
// import 'package:orop/core/functions/handlingdatacontroller.dart';
// import 'package:orop/core/services/services.dart';
// import 'package:orop/data/datasource/remote/comments._data.dart';
// import 'package:orop/data/model/commentsmodel.dart';
// import 'package:orop/view/comment/comment.dart';

// class UpdateViewEditController extends GetxController {
//   List<CommentsModel> data = [];
//   CommentsData commentsData = CommentsData(Get.find());
//   late StatusRequest statusRequest;
//   MyServices myServices = Get.find();
//   late TextEditingController name1;

//   late CommentsModel commentsModel;
//   String? comid;
//   String? comment;
//   int? appuie;
//   CommentsController controller = Get.put(CommentsController());

//   ProductDetailsControllerImp controllerImp =
//       Get.put(ProductDetailsControllerImp());

//   intialData() async {
//     if (Comments() == true) {
//       statusRequest = StatusRequest.loding;
//       await getUpdateViewEdit(commentsModel.comId!);
//       commentsModel = Get.arguments['edit'];
//       comid = Get.arguments["comid"];
//       comment = Get.arguments["comment"];
//       appuie = Get.arguments["appuie"];
//       statusRequest = StatusRequest.success;
//       update();
//     } else {
//       // controller.getComments(
//       //     controllerImp.productsModel.productsId!, controller.cid!);
//     }
//   }

//   editComments(String comid) async {
//     statusRequest = StatusRequest.loding;
//     update();
//     var response = await commentsData.editData(name1.text, comid);
//     statusRequest = handlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         // String newComment = name1.text;
//         // String comid = Get.arguments["id"];
//         // Get.back();
//         getUpdateViewEdit(commentsModel.comId!);
//         // Get.back();
//         Get.offNamed(AppRoute.comment,
//             arguments: {commentsModel.comId!, commentsModel.comment!});
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   getUpdateViewEdit(String comid) async {
//     // data.clear();
//     statusRequest = StatusRequest.loding;
//     update();
//     var response = await commentsData.getData(
//         myServices.sharedPreferences.getString("id")!, comid);
//     print("========================== Controller $response ");
//     statusRequest = handlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         if (response['datacom']['status'] == "success") {
//           List dataresopnse = response['datacom']['data'];
//           data.clear();
//           data.addAll(dataresopnse.map((e) => CommentsModel.fromJson(e)));
//           // print("data");
//           // print(data);
//         } else {
//           statusRequest = StatusRequest.failure;
//         }
//       }

//       update();
//     }
//   }

//   gotoPageCommentEdit(comid, comment, appuie) {
//     name1.text = comment;
//     Get.toNamed(AppRoute.edit,
//         arguments: {"id": comid, "name": comment, "appuie": appuie});
//   }

//   @override
//   void onInit() {
//     name1 = TextEditingController();
//     intialData();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     name1.dispose();
//     super.dispose();
//   }
// }
