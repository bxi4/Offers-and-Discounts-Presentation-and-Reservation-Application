import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/adminservices/orders/details_data.dart';
import 'package:orop/data/model/cardmodel.dart';
import 'package:orop/data/model/orders_model.dart';

class AdminServicesOrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  List<Marker> marker = [];
  var i;

  MyServices myServices = Get.find();

  AdminServicesOrdersDetailsData ordersDetailsData =
      AdminServicesOrdersDetailsData(Get.find());

  List<CartModel> data = [];
  late StatusRequest statusRequest;
  CameraPosition? cameraPosition;
  Completer<GoogleMapController>? completercontroller;

  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!,
        myServices.sharedPreferences.getString("services_id")!);
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

  // intialData() {
  //   if (ordersModel.ordersType == "0") {
  //     cameraPosition = CameraPosition(
  //       target: LatLng(double.parse(ordersModel.addressLat!),
  //           double.parse(ordersModel.addressLong!)),
  //       zoom: 12.4746,
  //     );
  //     marker.add(Marker(
  //         markerId: MarkerId("1"),
  //         position: LatLng(double.parse(ordersModel.addressLat!),
  //             double.parse(ordersModel.addressLong!))));
  //   }

  //   //getData();
  // }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getData();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
