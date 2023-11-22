import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class AdminServicesNotificationData {
  Crud crud;
  AdminServicesNotificationData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.notification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
