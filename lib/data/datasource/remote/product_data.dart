import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class ProductData {
  Crud crud;
  ProductData(this.crud);
  getData(String catid, String sid, String userid) async {
    var response = await crud.postData(AppLink.products,
        {"id": catid.toString(), "sid": sid.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }

  productTopSelling(String sid) async {
    var response =
        await crud.postData(AppLink.producttoselling, {"sid": sid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
