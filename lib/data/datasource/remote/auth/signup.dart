import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username, String password, email, phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone
    });
    return response.fold((l) => l, (r) => r);
  }
}
