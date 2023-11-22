import 'package:orop/controller/adminservices/products/view_controller.dart' as viewData;
import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';
import 'package:get/get.dart';

class AdminServicesOrdersPendingData {
  Crud crud;
  AdminServicesOrdersPendingData(this.crud);
  getData(String serid) async {
    var response = await crud
        .postData(AppLink.adminservisesviewpendingorders, {"serid": serid});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(
    
    
      String userid, String serid, String orderid, String sername) async {
    var response = await crud.postData(AppLink.adminservisesapproveOrder, {
      "usersid": userid,
      "serid": serid,
      "ordersid": orderid,
      "sername": sername
    });
    return response.fold((l) => l, (r) => r);
  }
}
