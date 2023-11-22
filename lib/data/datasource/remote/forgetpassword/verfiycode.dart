import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class VerfiyCodeForgetPasswordData {
  Crud crud;
  VerfiyCodeForgetPasswordData(this.crud);
  postdata(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verfiycodeforgetpassword,
        {"email": email, "verfiycode": verfiycode});
    return response.fold((l) => l, (r) => r);
  }
}
