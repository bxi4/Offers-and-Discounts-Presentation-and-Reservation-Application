import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/cart_data.dart';
import 'package:orop/data/model/cardmodel.dart';
import 'package:orop/data/model/myfavoritemodel.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/data/model/servicesmodel.dart';
import 'package:orop/linkapi.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // HomeServerControllerImp c = Get.put(HomeServerControllerImp());
  late ProductsModel productsModel;
  String productID = "";
  String serviceID = "";
  late CartModel cartModel;
  late MyFavoriteModel myFavoriteModel;
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  CardData cardData = CardData(Get.find());
  List data = [];
  int countitems = 0;
  bool act = false;
  var i;
  intialData() async {
    statusRequest = StatusRequest.loding;
    if(Get.arguments['productsModel2'] == null)
    productsModel = Get.arguments['productsModel'];
    else{
      productsModel = ProductsModel();
      productsModel = Get.arguments['productsModel2'];
      update();
    }
    //i = productsModel.servicesImage;
    countitems = await getCountItems(productsModel.productsId!,
        productsModel.categoriesId!, productsModel.servicesId!);
    statusRequest = StatusRequest.success;
    update();
  }

  getCountItems(String productsid, String catid, String serid) async {
    statusRequest = StatusRequest.loding;
    var response = await cardData.getCountCart(
        myServices.sharedPreferences.getString("id")!,
        productsid,
        catid,
        serid);
    // ignore: avoid_print
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("========================================");
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  image(String imagePath) {
    try {
      if (productsModel.servicesImage != null &&
          imagePath != null &&
          imagePath.isNotEmpty) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: CachedNetworkImage(
                imageUrl: imagePath,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill));
        //return Image.file(File(imagePath), fit: BoxFit.fill);
      } else {
        print('Error network image: ');
        return Image.asset(
          AppImageAsset.usersView,
          // fit: BoxFit.fill,
        );
      }
    } catch (e) {
      print('Error loading network image: $e');
    }
  }

  addProduct(String productsid, String serid, String catid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await cardData.addCart(
        myServices.sharedPreferences.getString("id")!,
        productsid,
        serid,
        catid);
    print("========================== Controller $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
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
            messageText: const Text(
              " تم اضافة المنتج الى حجوزاتك",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteProduct(String productsid, String sid) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await cardData.deleteData(
        myServices.sharedPreferences.getString("id")!, productsid, sid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
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
            messageText: const Text(" تم حذف المنتج من الحجوات",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  add() {
    addProduct(productsModel.productsId!, productsModel.servicesId!,
        productsModel.categoriesId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteProduct(productsModel.productsId!, productsModel.servicesId!);
      countitems--;
      update();
    }
  }

  gotoPageComment(ProductsModel productsModel) {
    Get.toNamed("/comment", arguments: {
      "productsModel": productsModel,
    });
  }

  @override
  void onInit() {
    //updateUser();
    intialData();

    super.onInit();
  }
}
