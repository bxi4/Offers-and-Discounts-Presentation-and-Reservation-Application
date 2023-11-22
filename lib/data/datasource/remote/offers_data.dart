import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.offers, {"usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
