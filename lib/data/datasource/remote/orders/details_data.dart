import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String orderid) async {
    var response = await crud.postData(AppLink.detailsorders, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
