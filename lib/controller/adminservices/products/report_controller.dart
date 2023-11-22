import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/adminservices/products_data.dart';
import 'package:orop/data/model/productsmodel.dart';

class RepoetsController extends GetxController {
  AdminServicesProductsData adminServicesProductsData =
      AdminServicesProductsData(Get.find());

  //Rx<DateTime> selectedDateTime = DateTime.now().obs;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<ProductsModel> data = [];

  getData(String start_date, String end_date) async {
    String serid = myServices.sharedPreferences.getString("services_id")!;
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response =
        await adminServicesProductsData.report(start_date, end_date, serid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        List datalist = response['data'];

        data.addAll(datalist.map((e) => ProductsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  var selectedDate = DateTime.now().obs;
  var selectedDate1 = DateTime.now().obs;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate:
          selectedDate.value != null ? selectedDate.value : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: "Select DOB",
      errorFormatText: "Enter valid date",
      errorInvalidText: "Enter valid date range",
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
      //  selectableDayPredicate: disableDate
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate.value = pickedDate;
    }
    print("selectedDate========= ${selectedDate.value}");
  }

  chooseDate1() async {
    DateTime? pickedDate1 = await showDatePicker(
      context: Get.context!,
      initialDate:
          selectedDate1.value != null ? selectedDate1.value : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      // initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: "Select DOB",
      errorFormatText: "Enter valid date",
      errorInvalidText: "Enter valid date range",
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
      //  selectableDayPredicate: disableDate
    );
    if (pickedDate1 != null && pickedDate1 != selectedDate1) {
      selectedDate1.value = pickedDate1;
    }
    print("selectedDate1============= ${selectedDate1.value}");
  }
}
//_showDatePicker()