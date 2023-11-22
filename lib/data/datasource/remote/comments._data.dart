import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class CommentsData {
  Crud crud;
  CommentsData(this.crud);
  getData(String pid) async {
    var response = await crud.postData(AppLink.comments, {"pid": pid});
    return response.fold((l) => l, (r) => r);
  }

  updateData(String userid, String comid) async {
    var response = await crud
        .postData(AppLink.updateveiwedit, {"userid": userid, "comid": comid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String userid, String name, String sername, String sid, String cid,
      String pid) async {
    var response = await crud.postData(AppLink.addcomments, {
      "userid": userid,
      "name": name,
      "sername": sername,
      "sid": sid,
      "cid": cid,
      "pid": pid
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String name, String pid, String comid) async {
    var response = await crud.postData(
        AppLink.editcomments, {"name": name, "pid": pid, "comid": comid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deletecomments, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
