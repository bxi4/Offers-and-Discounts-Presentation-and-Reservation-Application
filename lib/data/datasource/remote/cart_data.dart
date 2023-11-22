import 'package:orop/core/class/curd.dart';
import 'package:orop/linkapi.dart';

class CardData {
  Crud crud;
  CardData(this.crud);
  addCart(String userid, String productsid, String serid, String catid) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "userid": userid,
      "productsid": productsid,
      "sid": serid,
      "catid": catid
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(
      String usersid, String productsid, String catid, String serid) async {
    var response = await crud.postData(AppLink.cartgetcountitems, {
      "userid": usersid,
      "productsid": productsid,
      "catid": catid,
      "sid": serid
    });
    return response.fold((l) => l, (r) => r);
  }

  myCart(String userid) async {
    var response = await crud.postData(AppLink.cartView, {"usersid": userid});
    return response.fold((l) => l, (r) => r);
  }

  viewDrop(String userid, String sid) async {
    var response =
        await crud.postData(AppLink.viewdrop, {"userid": userid, "sid": sid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String userid, String productid, String sid) async {
    var response = await crud.postData(AppLink.deleteformcart,
        {"userid": userid, "proid": productid, "sid": sid});
    return response.fold((l) => l, (r) => r);
  }

  deleteallQua(String id) async {
    var response = await crud.postData(AppLink.deleteallQua, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteAllData(String id) async {
    var response = await crud.postData(AppLink.deleteallcart, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname, String couponserid) async {
    var response = await crud.postData(AppLink.checkcoupon,
        {"couponname": couponname, "couponserid": couponserid});
    return response.fold((l) => l, (r) => r);
  }

  addCartCount(String userid, String id1, String serid, String catid,
      String prodid) async {
    var response = await crud.postData(AppLink.addcartCount, {
      "userid": userid,
      "id1": id1,
      "serid": serid,
      "catid": catid,
      "prodid": prodid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeCartCount(
      String userid, String serid, String catid, String prodid) async {
    var response = await crud.postData(AppLink.removecartCount, {
      "userid": userid,
      "serid": serid,
      "catid": catid,
      "prodid": prodid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeExitCartCount(String userid) async {
    var response =
        await crud.postData(AppLink.removeexitcartCount, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
