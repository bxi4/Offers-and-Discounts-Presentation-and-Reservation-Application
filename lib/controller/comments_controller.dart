import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/auth/login_controllel.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/productdetails_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/comments._data.dart';
import 'package:orop/data/model/commentsmodel.dart';
import 'package:orop/data/model/productsmodel.dart';

class CommentsController extends GetxController {
  LoginControllerImp controllerL = Get.put(LoginControllerImp());
  HomeServerControllerImp hsci = Get.put(HomeServerControllerImp());
  List<CommentsModel> data = [];
  CommentsData commentsData = CommentsData(Get.find());
  int? cid;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  ProductDetailsControllerImp controllerImp =
      Get.put(ProductDetailsControllerImp());
  late TextEditingController name;
  late TextEditingController name1;
  bool isSignIn = false;
  late CommentsModel commentsModel;
  String? comid;
  String? comment;
  String? pid;
  int? appuie;

  intialData() async {
    statusRequest = StatusRequest.loding;
    await getComments(controllerImp.productsModel.productsId!);
    // pid = Get.arguments["pid"];
    // commentsModel = Get.arguments['commentsModel'];
    comid = Get.arguments["comid"];
    comment = Get.arguments["comment"];
    //appuie = Get.arguments["appuie"];

    // await addComments(
    //     controllerImp.productsModel.tabledetailsServiId!,
    //     controllerImp.productsModel.categoriesId!,
    //     controllerImp.productsModel.productsId!);

    statusRequest = StatusRequest.success;
    update();
  }

  addComments(String sername, String sid, String cid, String pid) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await commentsData.addData(
        myServices.sharedPreferences.getString("id")!,
        name.text,
        sername,
        sid,
        cid,
        pid);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getComments(controllerImp.productsModel.productsId!);
        // Get.toNamed(AppRoute.comment);
        // Get.delete<CommentsController>();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  editComments(String comid, String pid) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await commentsData.editData(name1.text, pid, comid);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        String newComment = name1.text;
        Get.back();
        int index = data.indexWhere((element) => element.comId == comid);
        if (index != -1) {
          data[index].comment = newComment;
          update([index]); // Update only the modified item
          //Get.back();
        } else {
          // Update all items if the modified comment is not found
          getComments(commentsModel.commentProductid!);
        }
      } else {
        Get.back();
        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletecomment(String comid) async {
    //data.clear();
    var response = await commentsData.deleteData(comid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getComments(controllerImp.productsModel.productsId!);
        Get.rawSnackbar(
            title: "اشعار",
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(10),
            borderRadius: 20,
            backgroundColor: AppColor.secondColor,
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
            messageText: const Text(" تم حذف التعليق  ",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getComments(String pid) async {
    // data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await commentsData.getData(pid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacom']['status'] == "success") {
          List dataresopnse = response['datacom']['data'];

          data.clear();
          data.addAll(dataresopnse.map((e) => CommentsModel.fromJson(e)));
          // List<CommentsModel> newData =
          //     dataresopnse.map((e) => CommentsModel.fromJson(e)).toList();

          // data.clear();
          // data.addAll(newData);

        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }

  updateComment(String comId, String newComment) {
    int index = data.indexWhere((comment) => comment.comId == comId);
    if (index != -1) {
      data[index].comment = newComment;
      update();
    }
  }

  gotoPageCommentEdit(comid, comment, pid) {
    name1.text = comment;
    Get.toNamed(AppRoute.edit, arguments: {
      "id": comid,
      "name": comment,
      "pid": pid,
      //"appuie": appuie
    });
  }

  gotoPageProductDetails(ProductsModel productsModel) {
    Get.toNamed("/comment", arguments: {
      "productsModel": productsModel,
    });
    Get.delete<CommentsController>();
  }

  // updateUser() async {
  //   if (myServices.sharedPreferences.getString("id")! == hsci.username!) {
  //     isSignIn = await myServices.sharedPreferences.getString("id")! != true;
  //   } else {
  //     isSignIn = false;
  //   }
  //   update();
  // }

  @override
  void onInit() {
    //updateUser();
    name = TextEditingController();
    name1 = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    name1.dispose();
    super.dispose();
  }
}
