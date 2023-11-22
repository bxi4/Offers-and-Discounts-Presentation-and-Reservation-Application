import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/product_data.dart';
import 'package:orop/data/model/productsmodel.dart';

abstract class ProductController extends GetxController {
  initalData();
  changeCat(int val, String catval, String serval);
  getProduct(String categoryid, String serviceid);
  gotoPageProductDetails(ProductsModel productsModel);
}

class ProductControllerImp extends searchMixController {
  var m;
  var img;
  List categories = [];
  String? catid;
  String? serid;
  int? selecedCat;

  int? i;

  ProductData productData = ProductData(Get.find());
  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  initalData() {
    categories = Get.arguments['categories'];
    selecedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    serid = Get.arguments['serid'];

    getProduct(catid!, serid!);
  }

  @override
  void onInit() {
    search = TextEditingController();
    initalData();
    super.onInit();
  }

  changeCat(int val, String catval, String serval) {
    selecedCat = val;
    catid = catval;
    serid = serval;
    getProduct(catid!, serid!);
    update();
  }

  getProduct(categoryid, serviceid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    var response = await productData.getData(
        categoryid, serviceid, myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoPageProductDetails(ProductsModel productsModel) {
    Get.toNamed("/productdetails", arguments: {
      "productsModel": productsModel,
    });
    //Get.delete<ProductDetailsControllerImp>();
  }
}
