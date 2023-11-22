import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class AllSubsData {
  Crud crud;
  AllSubsData(this.crud);
  getData(String userid) async {
    var response =
        await crud.postData(AppLink.getAllSubs, {"id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
