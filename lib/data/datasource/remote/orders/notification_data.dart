import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.notification, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  notificationCount(String userid) async {
    var response =
        await crud.postData(AppLink.countnotification, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  notificationRead(String userid) async {
    var response =
        await crud.postData(AppLink.notificationread, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
