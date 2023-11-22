import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  getData(String serid) async {
    var response =
        await crud.postData(AppLink.categories, {"id": serid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  subscribeServiceData(String serid, String userid) async {
    var response =
        await crud.postData(AppLink.subscribe, {"serviceid": serid.toString(), "id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  unSubscribeServiceData(String serid, String userid) async {
    var response =
        await crud.postData(AppLink.unSubscribe, {"serviceid": serid.toString(), "id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  checkSubscribeServiceData(String serid, String userid) async {
    var response =
        await crud.postData(AppLink.checkSubscribe, {"serviceid": serid.toString(), "id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getSettingsData(String serid) async {
    var response =
        await crud.postData(AppLink.settings, {"id": serid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
