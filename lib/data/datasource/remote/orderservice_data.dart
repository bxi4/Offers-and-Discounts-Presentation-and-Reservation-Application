import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class OrderService {
  Crud crud;
  OrderService(this.crud);
  upgradeUser(String userID, String serviceName, String serviceDesc,
      String serviceTypeID, String serviceAddress) async {
    var response = await crud.postData(AppLink.orderService, {
      "service_name": serviceName,
      "service_address": serviceAddress,
      "service_desc": serviceDesc,
      "users_id": userID,
      "service_type_id": serviceTypeID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
