import 'dart:io';
import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class CouponData {
  Crud crud;
  CouponData(this.crud);
  getCoupon(String serviceID) async {
    var response = await crud.postData(AppLink.couponView, {
      "id": serviceID
    });
    return response.fold((l) => l, (r) => r);
  }

  addCoupon(String id, String name, String count, String discount, String time) async {
    var response = await crud.postData(AppLink.couponadd, {
      "id": id,
      "couponname": name,
      "couponcount": count,
      "coupondiscount": discount,
      "datevalue": time
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCoupon(String serviceID, String couponID) async {
    var response = await crud.postData(AppLink.couponDelete, {
      "id": serviceID,
      "couponid": couponID
    });
    return response.fold((l) => l, (r) => r);
  }
}
