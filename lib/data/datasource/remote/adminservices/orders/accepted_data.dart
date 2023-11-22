import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class AdminServicesOrdersAcceptedData {
  Crud crud;
  AdminServicesOrdersAcceptedData(this.crud);
  getData(String serid) async {
    var response = await crud
        .postData(AppLink.adminservisesviewacceptedorders, {"serid": serid});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersid, String serid, String usersid, String ordertype,
      String sername) async {
    var response = await crud.postData(AppLink.adminservisesprepareorders, {
      "ordersid": ordersid,
      "serid": serid,
      "usersid": usersid,
      "ordertype": ordertype,
      "sername": sername
    });
    return response.fold((l) => l, (r) => r);
  }
}
