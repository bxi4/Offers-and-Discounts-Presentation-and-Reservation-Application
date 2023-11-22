import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingorders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.deleteorders, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
