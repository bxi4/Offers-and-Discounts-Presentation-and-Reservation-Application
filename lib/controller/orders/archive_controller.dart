import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/orders/archive_data.dart';
import 'package:orop/data/model/orders_model.dart';

class OrdersArchiveController extends GetxController {
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  // OrdersDetailsController controller = Get.put(OrdersDetailsController());
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());
  MyServices myServices = Get.find();

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else {
      return "Recive";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await ordersArchiveData
        .getData(myServices.sharedPreferences.getString("id")!);
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

  submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response =
        await ordersArchiveData.rating(ordersid, rating.toString(), comment);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        statusRequest = StatusRequest.success;
        getOrders();
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

  intialData() {
    getOrders();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
