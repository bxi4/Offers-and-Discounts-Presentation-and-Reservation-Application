import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/adminservices/orders/pending_data.dart';
import 'package:orop/data/datasource/remote/adminservices/products_data.dart';
import 'package:orop/data/model/productsmodel.dart';

class AdminServicesProductsController extends GetxController {
  int notifcationBadge = 0;
  bool visibileBadge = false;
  AdminServicesProductsData adminServicesProductsData =
      AdminServicesProductsData(Get.find());

  List<ProductsModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  AdminServicesOrdersPendingData ordersPendingData =
      AdminServicesOrdersPendingData(Get.find());

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("services_id")!);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        notifcationBadge = listdata.length;
        // if (!myServices.sharedPreferences.getBool("orderBadgeRemove")!) {
        if (notifcationBadge > 0) {
          visibileBadge = true;
        }
        // }
      } else {
        statusRequest = StatusRequest.failure;
      }
      //End
    }

    update();
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await adminServicesProductsData
        .get(myServices.sharedPreferences.getString("services_id")!);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ProductsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  updateOrderBadge() {
    notifcationBadge -= 1;
    if (notifcationBadge <= 0) {
      visibileBadge = false;
    }
    update();
  }

  openOrders() {
    // myServices.sharedPreferences.setBool("orderBadgeRemove", true);
    // visibileBadge = false;
    // update();
    Get.toNamed(AppRoute.adminservicesorderscreen);
  }

  deleteProducts(String id, String imagename) async {
    adminServicesProductsData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.productsId == id);
    update();
  }

  gotoPageEdit(ProductsModel productsModel) {
    Get.toNamed(AppRoute.adminservicesproductsedit,
        arguments: {"productsModel": productsModel});
  }

  @override
  void onInit() {
    // myServices.sharedPreferences.setBool("orderBadgeRemove", false);
    getData();
    // getDataOrders(myServices.sharedPreferences.getString("services_id")!);
    getOrders();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.homescreenadmin);
    return Future.value(false);
  }
}
