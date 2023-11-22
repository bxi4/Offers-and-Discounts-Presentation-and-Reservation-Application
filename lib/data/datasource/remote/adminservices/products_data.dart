import 'dart:io';

import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class AdminServicesProductsData {
  Crud crud;
  AdminServicesProductsData(this.crud);
  get(String servicesid) async {
    var response =
        await crud.postData(AppLink.productsview, {"id": servicesid});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.productsadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  sendNotificationData(String servicesid, String servicesname, String imageNameString) async {
    var response =
        await crud.postData(AppLink.sendNotification,{"id": servicesid,
        "service_name": servicesname,
        "image_name": imageNameString
        
        });
    return response.fold((l) => l, (r) => r);

  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.productsedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.productsedit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.productsdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  report(String start_date, String end_date, String serid) async {
    var response = await crud.postData(AppLink.reportview,
        {"start_date": start_date, "end_date": end_date, "serid": serid});
    return response.fold((l) => l, (r) => r);
  }
}
