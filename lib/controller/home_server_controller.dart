import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:orop/controller/categories_controller.dart';
import 'package:orop/controller/products_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/home_data.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/data/model/offersmodel.dart';
import 'package:orop/data/model/productsmodel.dart';

import '../data/model/servicesmodel.dart';

abstract class HomeServerController extends searchMixController {
  initialData();
  getdata();
  gotoCategories(List services, int selecedSer, String serid);
  gotoItems(
      List categories, int selecedCat, String categoryid, String serviceid);
}

class HomeServerControllerImp extends HomeServerController {
  var m;
  var img;
  String? username;
  String? id;
  String? lang;
  bool isNotificationRead = false;

  String titleHomeCard = "";
  String bodyHomeCard = "";
  late ServicesModel servicesModel;

  @override
  HomeData homedata = HomeData(Get.find());

  //List data = [];
  List services = [];
  List categories = [];
  List products = [];
  List notification = [];
  //List settingsdata = [];
  List specialoffers = [];

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    print("==============users $id");
    //nameser = myServices.sharedPreferences.getString("nameser");
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loding;
    var usersid = myServices.sharedPreferences.getString("id")!;
    var response = await homedata.getData(usersid);
    // print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        services.addAll(response['services']['data']);
        categories.addAll(response['categories']['data']);
        products.addAll(response['products']['data']);
        try {
          specialoffers.addAll(response['special_offers']['data']);
        } catch (e) {
          print("Not Image: $e");
        }

        if (response.containsKey('notification') &&
            response['notification'] != null &&
            response['notification']['data'] != null) {
          notification.addAll(response['notification']['data']);

          if (notification.isNotEmpty &&
              notification.any((item) => item['notification_read'] == "0")) {
            isNotificationRead = true;
          } else {
            isNotificationRead = false;
          }
        } else {
          // إشعارات غير متوفرة أو فارغة
          isNotificationRead = false;
        }
        print("============== notification_read 3 $isNotificationRead");
        print("============== usersid 3 $usersid");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  image(String imagePath) {
    try {
      if (imagePath != null &&
          imagePath.isNotEmpty &&
          specialoffers.isNotEmpty) {
        return ClipRRect(
            // borderRadius: BorderRadius.circular(22),
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
  // Map isRead = {};
  // setNotificationRead(id, val) {
  //   isRead[id] = val;
  //   update();
  // }

  @override
  gotoItems(categories, selecedCat, categoryid, serviceid) {
    Get.toNamed(AppRoute.product, arguments: {
      "categories": categories,
      "selectedcat": selecedCat,
      "catid": categoryid,
      "serid": serviceid,
    });
    // Get.delete<ProductControllerImp>();
  }

  @override
  gotoCategories(List services, int selecedSer, serid) {
    Get.toNamed(AppRoute.categoris, arguments: {
      "services": services,
      "selectedser": selecedSer,
      "serid": serid,
    });
    update();
    Get.delete<CategoriesControllerImp>();
  }

  gotoPageProductDetails(ProductsModel productsModel) {
    Get.toNamed("productdetails", arguments: {
      "productsModel": productsModel,
    });
  }

  gotoPageProductDetails1(ProductsModel productsModel, int selecedSer) {
    Get.toNamed("productdetails", arguments: {
      "productsModel": productsModel,
      "selecedSer": selecedSer
      // "serid": serid,
      // "catid": catid,
    });
  }
}

// ignore: camel_case_types
class searchMixController extends GetxController {
  MyServices myServices = Get.find();
  HomeData homedata = HomeData(Get.find());
  late StatusRequest statusRequest;

  List<ProductsModel> listdata = [];
  TextEditingController? search;
  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    SearchData();
    update();
  }

  searchClear() {
    search!.clear();
    listdata.clear();
  }

  SearchData() async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await homedata.searchData(search!.text);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        // searchClear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ProductsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}
/** notification.addAll(response['notification']['data']);
        if (notification.isNotEmpty &&
            notification[0]['notification_read'] == "0") {
          // تحديد قيمة isNotificationRead بناءً على القاعدة التي تحددها
          isNotificationRead =
              notification.any((item) => item['notification_read'] == "0");
        } else {
          isNotificationRead =
              notification.any((item) => item['notification_read'] != "0");
          print("============== notification_read 2 $isNotificationRead");
        }
        print("============== notification_read 3 $isNotificationRead"); */