import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/data/datasource/remote/offers_data.dart';
import 'package:orop/data/model/productsmodel.dart';

class OffersController extends searchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ProductsModel> data = [];
  late StatusRequest statusRequest;
  HomeServerControllerImp controllerImp = Get.put(HomeServerControllerImp());
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    var response =
        await offersData.getData(myServices.sharedPreferences.getString("id")!);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.clear();
        data.addAll(listdata2.map((e) => ProductsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  initialData() {
    getData();
  }

  gotoPageProductDetails(ProductsModel productsModel) {
    Get.toNamed("/productdetails", arguments: {
      "productsModel": productsModel,
    });
  }

  @override
  void onInit() {
    initialData();
    search = TextEditingController();
    super.onInit();
  }
}
