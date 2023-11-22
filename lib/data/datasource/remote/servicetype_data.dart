import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class ServiceType {
  Crud crud;
  ServiceType(this.crud);
  getTypes() async {
    var response = await crud.postData(AppLink.serviceType, {});
    return response.fold((l) => l, (r) => r);
  }
}
