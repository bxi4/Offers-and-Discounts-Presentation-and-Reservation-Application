import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class AdminServicesOrdersDetailsData {
  Crud crud;
  AdminServicesOrdersDetailsData(this.crud);
  getData(String id, String serid) async {
    var response = await crud.postData(
        AppLink.adminservisesdetailsorders, {"id": id, "serid": serid});
    return response.fold((l) => l, (r) => r);
  }
}
