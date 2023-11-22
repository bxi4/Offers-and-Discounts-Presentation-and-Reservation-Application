import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/orders/pending_data.dart';
import 'package:orop/data/model/orders_model.dart';

class OrdersPendingController extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  CartController controllerc = Get.put(CartController());
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  MyServices myServices = Get.find();
  OrdersModel? ordersModel;

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Pending Approval";//ما زال يحتاج بتصدير
    } else {
      return "Recive";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Upon Receipt";
    } else if (val == "1") {
      return "The Order is being Prepared ";//يتم تحضير الطلب
    } else if (val == "2") {
      return "Ready To Picked up";//جاهز للاستلام
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
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

  deleteOrders(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await ordersPendingData.deleteData(orderid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshorder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      //End
    }

    update();
  }

  refreshorder() {
    //ordersModel = Get.arguments['ordersModel'];
    getOrders();
  }

  @override
  void onInit() {
    refreshorder();
    super.onInit();
  }
}
