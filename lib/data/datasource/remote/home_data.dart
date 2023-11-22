import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.homepage, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response =
        await crud.postData(AppLink.searchProduct, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
