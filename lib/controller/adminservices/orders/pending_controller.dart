import 'package:get/get.dart';
import 'package:orop/controller/adminservices/products/view_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/adminservices/orders/pending_data.dart';
import 'package:orop/data/model/orders_model.dart';

class AdminServicesOrdersPendingController extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  AdminServicesOrdersPendingData ordersPendingData =
      AdminServicesOrdersPendingData(Get.find());
  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else {
      return "Recive";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Upon Receipt";
    } else if (val == "1") {
      return "The request has been approved "; //يتم تحضير الطلب
    } else if (val == "2") {
      return "Ready To Picked up";
    } else {
      return "Archive";
    }
  }

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
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      //End
    }

    update();
  }

  approveOrders(String userid, String ordersid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await ordersPendingData.approveOrder(
        userid,
        myServices.sharedPreferences.getString("services_id")!,
        ordersid,
        myServices.sharedPreferences.getString("services_name")!);
    print("=====$userid");
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.find<AdminServicesProductsController>().updateOrderBadge();
        getOrders();
        // List listdata = response['data'];
        // data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      //End
    }

    update();
  }

  refreshorder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
