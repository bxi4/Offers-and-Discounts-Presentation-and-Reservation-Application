import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class AdminServicesOrdersArchiveData {
  Crud crud;
  AdminServicesOrdersArchiveData(this.crud);
  getData() async {
    var response =
        await crud.postData(AppLink.adminservisesviewarchiveorders, {});
    return response.fold((l) => l, (r) => r);
  }

  rating(String ordersid, String rating, String comment) async {
    var response = await crud.postData(
        AppLink.rating, {"id": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
