import 'dart:io';
import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class AdminServicesCategoriesData {
  Crud crud;
  AdminServicesCategoriesData(this.crud);
  get() async {
    var response = await crud.postData(AppLink.categoriesview, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.categoriesadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.categoriesedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoriesedit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.categoriesdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
