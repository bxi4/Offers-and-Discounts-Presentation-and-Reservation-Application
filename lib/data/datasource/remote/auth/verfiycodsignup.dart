import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verfiyCodeSignUp, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
