import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/checkout_data.dart';

class CheckoutConttroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  // CartController cartController = Get.put(CartController());
  ReceiveOrderData receiveOrderData = ReceiveOrderData(Get.find());
  MyServices myServices = Get.find();
  String? paymentMethod;
  String? deliveryType;
  String? addressid = "0";

  late String servid;
  late String servName;
  int? selecedSer;

  // List selectedProductIds = [];
  late String selectedCompanyIds;
  late String companyNames;
  late String selectedProductId1;

  late String couponid;
  late String couponSerid;
  late String coupondiscount;
  late String priceorders;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    if (deliveryType == '0') {
      Get.back();
    }
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  //getShippingAddress() {}
  //HomeScreenControllerImp controllerImp = Get.put(HomeScreenControllerImp());
  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }

    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Or cancel");
    }

    statusRequest = StatusRequest.loding;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders.toString(),
      "couponid": couponid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
      "servicesid": selectedCompanyIds,
      "serName": companyNames.toString(),
      "productid": selectedProductId1,
    };
    print("=-=-=-=-= selectedCompanyIds ${selectedCompanyIds.toString()}");
    print("=-=-=-=-= priceorders ${priceorders.toString()}");
    print("=-=-=-=-= couponid ${couponid.toString()}");
    print("=-=-=-=-= companyNames ${companyNames.toString()}");
    print("=-=-=-=-= usersid ${myServices.sharedPreferences.getString("id")}");
    var response = await receiveOrderData.checkData(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homeServer);
        // couponid = "0";
        // priceorders = "0";
        // coupondiscount = "0";
        print("==================selectedProductIds id $selectedProductId1");
        print("==================m oninit $couponid");
        print("==================m oninit coupondiscount $coupondiscount");
        //cartController.myCart();
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();
  }

  //servid = Get.arguments?['servid'];

  @override
  void onInit() {
    couponid = Get.arguments?['couponid'];
    priceorders = Get.arguments?['priceorders'];
    coupondiscount = Get.arguments?['discountcoupon'];
    selectedProductId1 = Get.arguments?['selectedProductId1'];
    selectedCompanyIds = Get.arguments?['selectedCompanyIds'];
    companyNames = Get.arguments?['companyNames'];
    couponSerid = Get.arguments?['couponSerid'];
    print("==================selectedProductIds id $selectedProductId1");
    print("==================m oninit $couponid");
    print("================== $selecedSer");
    super.onInit();
  }
}
