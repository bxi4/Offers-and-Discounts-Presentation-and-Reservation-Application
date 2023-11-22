import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
    response.fold((l) => l, (r) => r);
  }
}
