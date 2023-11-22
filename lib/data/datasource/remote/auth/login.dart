import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email, String password) async {
    var response = await crud.postData(AppLink.Login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }

  isBrowserUser() async {
    var response = await crud.postData(AppLink.isbrowseruser, {});
    return response.fold((l) => l, (r) => r);
  }
}
