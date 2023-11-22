import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class ReceiveOrderData {
  Crud crud;
  ReceiveOrderData(this.crud);
  checkData(Map data) async {
    var response = await crud.postData(AppLink.receiptorders, data);
    return response.fold((l) => l, (r) => r);
  }
}
