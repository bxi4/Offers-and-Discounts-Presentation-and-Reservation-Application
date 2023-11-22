import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/adminservices/coupon/couponview_data.dart';
import 'package:orop/data/model/couponmodel.dart';

class CouponController extends GetxController {
  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
  TextEditingController couponName = TextEditingController();
  TextEditingController couponCount = TextEditingController();
  TextEditingController couponDiscount = TextEditingController();
  TextEditingController couponTime = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
  CouponData couponData = CouponData(Get.find());
  List<CouponModel> couponmodel = [];
  MyServices myServices = Get.find();

  getData() async {
    couponmodel.clear();
    String serviceID = myServices.sharedPreferences.getString("services_id")!;
    statusRequest = StatusRequest.loding;
    update();
    var response = await couponData.getCoupon(serviceID);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        couponmodel.addAll(datalist.map((e) => CouponModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCoupon(String couponID) async {
    String serviceID = myServices.sharedPreferences.getString("services_id")!;
    statusRequest = StatusRequest.loding;
    update();
    var response = await couponData.deleteCoupon(serviceID, couponID);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("bruh");
        await getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  
  addCoupon() async {
    String serviceID = myServices.sharedPreferences.getString("services_id")!;
    statusRequest = StatusRequest.loding;
    update();
    var response = await couponData.addCoupon(serviceID, couponName.text, couponCount.text, couponDiscount.text, couponTime.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("bruh");
        await getData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

}
