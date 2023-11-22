import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
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
import 'package:path/path.dart';

class AdminServicesProductsAddController extends GetxController {
  AdminServicesProductsData adminServicesProductsData =
      AdminServicesProductsData(Get.find());

  List<SelectedListItem> deopdownlist = [];

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

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

  MyServices myServices = Get.find();
  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

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

  addData() async {
    String serid = myServices.sharedPreferences.getString("services_id")!;
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Choose Image");

      statusRequest = StatusRequest.loding;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid!.text,
        "serid": serid
      };

      var response = await adminServicesProductsData.add(data, file!);
      print("========================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // Get.offNamed(AppRoute.adminservicesproductsview);

          await sendNotification(file!);
          Get.back();
          AdminServicesProductsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }

  sendNotification(File imageName) async {
    String serid = myServices.sharedPreferences.getString("services_id")!;
    String sername = myServices.sharedPreferences.getString("services_name")!;

    statusRequest = StatusRequest.loding;
    String imageNameString = basename(imageName.path);
    print(imageNameString);

    var response = await adminServicesProductsData.sendNotificationData(serid,sername,imageNameString);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("SENT");
      } else {
        print("FAILED");
        statusRequest = StatusRequest.failure;
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
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();

    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    super.onInit();
  }

  showDropdown(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [
          SelectedListItem(name: "name", value: "1"),
          SelectedListItem(name: "namear", value: "2"),
        ],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;
          //showSnackBar(list.toString());
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }
}
