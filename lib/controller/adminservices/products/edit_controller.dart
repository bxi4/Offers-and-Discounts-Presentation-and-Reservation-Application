import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/products/view_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/functions/uploadfile.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/adminservices/categories_data.dart';
import 'package:orop/data/datasource/remote/adminservices/products_data.dart';
import 'package:orop/data/model/categoriesmodel.dart';
import 'package:orop/data/model/productsmodel.dart';

class AdminServicesProductsEditController extends GetxController {
  AdminServicesProductsData adminServicesProductsData =
      AdminServicesProductsData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<SelectedListItem> deopdownlist = [];

  late TextEditingController name;
  late TextEditingController namear;

  late TextEditingController desc;
  late TextEditingController descar;

  late TextEditingController count;
  //late TextEditingController active;

  late TextEditingController price;
  late TextEditingController discount;

  TextEditingController? catid;
  TextEditingController? catname;

  ProductsModel? productsModel;

  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  String? active;

  MyServices myServices = Get.find();

  // chooseImage() async {
  //   file = await fileUploadCallery(true);
  //   update();
  // }

  changeStatusActive(val) {
    active = val;
    update();
  }

  showOptionImage() {
    showbottommenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamrea();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadCallery(false);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "active": active,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid!.text,
        "imageold": productsModel!.productsImage!,
        "id": productsModel!.productsId!
      };

      var response = await adminServicesProductsData.edit(data, file);
      print("========================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.adminservicesproductsview);
          AdminServicesProductsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }

  getCategories() async {
    AdminServicesCategoriesData categoriesData =
        AdminServicesCategoriesData(Get.find());

    statusRequest = StatusRequest.loding;
    update();
    var response = await categoriesData.get();
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        for (int i = 0; i < data.length; i++) {
          deopdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getCategories();
    productsModel = Get.arguments['productsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    name.text = productsModel!.productsName!;
    namear.text = productsModel!.productsNameAr!;
    desc.text = productsModel!.productsDesc!;
    descar.text = productsModel!.productsDescAr!;
    count.text = productsModel!.productsCount!;
    price.text = productsModel!.productsPrice!;
    discount.text = productsModel!.productsDiscount!;
    catid!.text = productsModel!.categoriesId!;
    catname!.text = productsModel!.categoriesName!;

    active = productsModel!.productsActive!;
    super.onInit();
  }
}
