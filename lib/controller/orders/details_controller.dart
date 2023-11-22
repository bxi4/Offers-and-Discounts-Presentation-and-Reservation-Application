import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/data/datasource/remote/orders/details_data.dart';
import 'package:orop/data/model/cardmodel.dart';
import 'package:orop/data/model/orders_model.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getData();
    super.onInit();
  }
}
