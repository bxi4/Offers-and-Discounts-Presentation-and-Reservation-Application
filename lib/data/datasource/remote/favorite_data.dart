import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';
import 'package:orop/view/screen/myfavorite.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userid, String productsid, String serid) async {
    var response = await crud.postData(AppLink.favoriteAdd,
        {"userid": userid, "productsid": productsid, "sid": serid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String productsid, String serid) async {
    var response = await crud.postData(AppLink.favoriteRemove,
        {"usersid": usersid, "productsid": productsid, "sid": serid});
    return response.fold((l) => l, (r) => r);
  }

  myFavorite(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteformfavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
