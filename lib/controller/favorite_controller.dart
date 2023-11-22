import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/favorite_data.dart';
import 'package:orop/data/model/myfavoritemodel.dart';

class FavoriteController extends searchMixController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  @override
  late StatusRequest statusRequest;
  late MyFavoriteModel myFavoriteModel;
  @override
  MyServices myServices = Get.find();
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String productsid, String serid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, productsid, serid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text(" تم اضافة المنتج الى المفضلة"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String productsid, String serid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, productsid, serid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text(" تم حذف المنتج من المفضلة"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  myFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await favoriteData
        .myFavorite(myServices.sharedPreferences.getString("id")!);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    //data.clear();
    var response = favoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    myFavorite();
    super.onInit();
  }

  gotoPageProductDetails(MyFavoriteModel myFavoriteModel) {
    Get.toNamed("/productdetails", arguments: {
      "myFavoriteModel": myFavoriteModel,
    });
  }

  // gotoPageProductDetailsF(MyFavoriteModel myFavoriteModel) {
  //   Get.toNamed("/productdetails", arguments: {
  //     "myFavoriteModel": myFavoriteModel,
  //   });
  //   Get.delete<ProductDetailsControllerImp>();
  // }
}
