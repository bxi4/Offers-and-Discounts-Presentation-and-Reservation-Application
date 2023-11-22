import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/cart_data.dart';
import 'package:orop/data/model/cardmodel.dart';
import 'package:orop/data/model/couponmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;
  List<String> selectedCompanyIdsWithCoupon = [];
  int? discountcoupon = 0;
  String? selectedCouponId;
  bool isFirstButtonPressed = false;
  bool isNotificationVisible = false;
  String? couponname;
  RxBool isDropdownVisible = false.obs;
  final RxBool isCouponSelected = false.obs;
  String? couponid;
  String? couponSerid;
  String? nameser;
  int? index;
  String? companyId;
  bool hasCurrentProductWithCartCountOne = false;
  List<String> otherCompanyIds = [];
  String? otherCompanyIdsString;
  String separator = "-"; // تعريف فاصلة مخصصة
  // String otherCompanyIds = '';
  var message;
  final RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;
  List<String> serid = [];
  var selectedSerid;
  String? selectedValue;
  CouponModel? couponModel;
  CardData cardData = CardData(Get.find());
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  late StatusRequest statusRequest;
  int totalQuantity = 0;
  MyServices myServices = Get.find();

  String? id1;
  String? selectedProductId1;
  String? selectedCompanyIds;
  // List<String> selectedCompanyIds = [];
  String? selectedCategoreisIds;
  String? companyNames;
  String? isCount;
  String? isOrderCart;

  String? selectedCompanyIdsString;
  String? compid;

  // onTap(String productId, String companyId, String companyName) {
  //   if (selectedProductIds.contains(productId)) {
  //     selectedProductIds.remove(productId);
  //     selectedCompanyIds.remove(companyId);
  //     //  companyNames.remove(companyId);
  //   } else {
  //     selectedProductIds.add(productId);
  //     selectedCompanyIds.add(companyId);
  //     companyNames[companyId] = companyName;
  //   }
  //   print("selectedProductIds: $selectedProductIds");
  //   print("selectedCompanyIds: $selectedCompanyIds");
  //   //companyNames[companyId] = companyName;
  // }

  addCart(String productsid, String serid, String catid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    var response = await cardData.addCart(
        myServices.sharedPreferences.getString("id")!,
        productsid,
        serid,
        catid);
    print("==========================addCart Controller $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(10),
            borderRadius: 20,
            backgroundColor: AppColor.secondColor,
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
            messageText: const Text(
              " تم اضافة المنتج الى حجوزاتك",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  deleteFromCart(String productsid, String sid) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await cardData.deleteData(
        myServices.sharedPreferences.getString("id")!, productsid, sid);
    print("==========================deleteFromCart Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(10),
            borderRadius: 20,
            backgroundColor: AppColor.secondColor,
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
            messageText: const Text(" تم حذف المنتج من الحجوات",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteallqua(String id) {
    Get.defaultDialog(
      title: "!Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'The product will be deleted along with the quantities',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black38,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      radius: 30,
      textCancel: "No",
      cancelTextColor: Colors.black,
      textConfirm: "YES",
      confirmTextColor: Colors.black,
      onCancel: () {
        Get.toNamed(AppRoute.cartscreen);
        refresh();
      },
      onConfirm: () {
        statusRequest = StatusRequest.loding;
        // update();
        var response = cardData.deleteallQua(id);
        data.removeWhere((element) => element.productsId == id);
        // data.clear();
        // priceorders = 0.0;
        getTotalPrice();
        Get.back();
        statusRequest = StatusRequest.success;
        update();
      },
      buttonColor: AppColor.primaryColor,
    );
  }

  deleteFromAllCart(String carid) {
    Get.defaultDialog(
      title: "!Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Ary you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black38,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      radius: 30,
      textCancel: "No",
      cancelTextColor: Colors.black,
      textConfirm: "YES",
      confirmTextColor: Colors.black,
      onCancel: () {
        Get.toNamed(AppRoute.cartscreen);
        refresh();
      },
      onConfirm: () {
        var response = cardData.deleteAllData(carid);
        data.removeWhere((element) => element.cartId == carid);
        data.clear();
        Get.back();
        update();
        // Get.toNamed(AppRoute.homeServer);
      },
      buttonColor: AppColor.primaryColor,
    );
  }

  bool isCodeExecuted = false;
  String? matchedId;
  // Future<void> mainFunction() async {
  //   // تنفيذ التحقق هنا
  //   if (selectedCompanyIds != controllercoupon!.text) {
  //     if (serid.contains(couponSerid1)) {
  //       matchedId = couponSerid;
  //       print("controller.==/=MM $matchedId  =Null");
  //       print("controllercoupon!.text.==/=MM ${controllercoupon!.text}  =Null");
  //       // استدعاء الدالة checkcoupon وتنفيذ الإجراءات الأخرى
  //       await checkcoupon(matchedId!);
  //     } else {
  //       Get.snackbar("!تنبيه", "يجب اختيار منتج من الشركة المحددة للكوبونD9");
  //       print("controller.==/=MM $selectedCompanyIds");
  //     }
  //   }
  // }

  checkcoupon(String couponserid) async {
    statusRequest = StatusRequest.loding;
    update();
    var response =
        await cardData.checkCoupon(controllercoupon!.text, couponserid);
    print("========================== Controller $response ");
    statusRequest = handlingData(response);
    // print("==========2==$selectedCompanyIds");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] != "success") {
        Get.snackbar("!تنبيه", " الشفرة ليست خاصة باهذه الشركة");
      } else {
        if (response['status'] == "success") {
          Map<String, dynamic> datacoupon = response['data'];
          couponModel = CouponModel.fromJson(datacoupon);
          discountcoupon = int.parse(couponModel!.couponDiscount!);
          couponname = couponModel!.couponName;
          couponid = couponModel!.couponId;
          isFirstButtonPressed = true;
          //couponSerid = couponModel!.couponSerid;
          if (isCouponSelected.value) {
            viewDrop(couponserid);
            selectedValue = "0";
            couponserid = "0";
          } else {
            myCart();
          }
        } else {
          statusRequest = StatusRequest.failure;
          discountcoupon = 0;
          couponname = null;
          couponid = null;
          // couponSerid = null;
          Get.snackbar("Warning", "Coupon Not Valid");
          //Get.snackbar("!تنبيه", "يجب اختيار منتج من الشركة المحددة للكوبون1");
        }
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    //selectedCompanyIds = '0';
    // couponid = "0";
    data.clear();
  }

  refershPage() {
    resetVarCart();
    myCart();
  }

  myCart() async {
    //data.clear();

    statusRequest = StatusRequest.loding;
    update();
    var response =
        await cardData.myCart(myServices.sharedPreferences.getString("id")!);
    // ignore: avoid_print
    // print("==========================myCart Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          // List<CartModel> data1 = data.toSet().toList();
          List dataresopnse = response['datacart']['data'];
          Map dataresopnsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresopnse.map((e) => CartModel.fromJson(e)));
          if (selectedCompanyIds == null) {
            for (var item1 in data) {
              serid.add(item1.cartSerid!);
              //break;
            }
          }
          isCount;
          otherCompanyIdsString;
          index;
          hasCurrentProductWithCartCountOne = data
              .any((item) => item.cartCount == "1" && item.cartOrders == "0");
          companyId;
          if (hasCurrentProductWithCartCountOne) {
            hasCurrentProductWithCartCountOne = true;
            print("================ true  $hasCurrentProductWithCartCountOne");
          } else {
            hasCurrentProductWithCartCountOne = false;
            print("================ false  $hasCurrentProductWithCartCountOne");
          }
          print("selectedCompanyIds1 ==/=MQ $selectedCompanyIds)}");
          otherCompanyIds =
              selectedCompanyIds != null ? [selectedCompanyIds!] : [];
          print("otherCompanyIds.==/=M = ${otherCompanyIds.length}");
          print("serid.== = $serid");
          totalcountitems = int.parse(dataresopnsecountprice['totalcount']);
          priceorders = double.parse(dataresopnsecountprice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  void updateDropdownVisibility(String text) {
    isDropdownVisible.value = text.isNotEmpty;
    update();
  }

  viewDrop(String sid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await cardData.viewDrop(
        myServices.sharedPreferences.getString("id")!, sid);
    // ignore: avoid_print
    print("========================== ViewDrop $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        List responsedata = response['data'];
        data.addAll(responsedata
            .map((e) => CartModel.fromJson(e))
            .where((element) => element.cartSerid == sid));
        isCount;
        hasCurrentProductWithCartCountOne =
            data.any((item) => item.cartCount == "1" && item.cartOrders == "0");
        companyId;
        if (hasCurrentProductWithCartCountOne) {
          hasCurrentProductWithCartCountOne = true;
          print("================ true  $hasCurrentProductWithCartCountOne");
        } else {
          hasCurrentProductWithCartCountOne = false;
          print("================ false  $hasCurrentProductWithCartCountOne");
        }
        print("================ true  $hasCurrentProductWithCartCountOne");

        print("selectedCompanyIds2 ==/=MQ $selectedCompanyIds)}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void setSelectedValue(String value) {
    selectedValue = value;
    update();
  }

  addServiceToCart() {
    if (selectedValue == null) {
      //   return selectedValue = data.first.servicesName!;
      // } else {
      // لم يتم اختيار أي قيمة بعد
      return;
    }
    // استخدم selectedValue هنا
    print("The selected value is: $selectedValue");
    // ...
  }

  intialData() {}

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السلة فارغه");
    if (hasCurrentProductWithCartCountOne && selectedCompanyIds != null) {
      if (isFirstButtonPressed && isDropdownVisible.value) {
        Get.toNamed(AppRoute.receiptorders, arguments: {
          "couponid": couponid ?? "0",
          "priceorders": priceorders.toString(),
          "discountcoupon": discountcoupon.toString(),
          "selectedProductId1": selectedProductId1.toString(),
          "selectedCompanyIds": selectedCompanyIds!,
          "companyNames": companyNames!,
          "couponSerid": couponSerid ?? "0",
        });
        controllercoupon!.clear();
      } else {
        if (isDropdownVisible.value) {
          Get.snackbar(
            "تنبيه",
            "الرجاء تنفيذ الشفرة",
            colorText: AppColor.black,
            icon: const Icon(Icons.notifications_active_outlined),
            backgroundColor: Colors.white38,
          );
        } else {
          Get.toNamed(AppRoute.receiptorders, arguments: {
            "couponid": couponid ?? "0",
            "priceorders": priceorders.toString(),
            "discountcoupon": discountcoupon.toString(),
            "selectedProductId1": selectedProductId1.toString(),
            "selectedCompanyIds": selectedCompanyIds!,
            "companyNames": companyNames!,
            "couponSerid": couponSerid ?? "0",
          });
        }
      }
    } else {
      Get.snackbar(
        "تنبيه",
        "الرجاء النقر على المنتجات الذي تريد طلبها",
        colorText: AppColor.black,
        icon: const Icon(Icons.notifications_active_outlined),
        backgroundColor: Colors.white38,
      );
      print("==========goto = $selectedCompanyIds");
    }
    print("==================selectedProductIds m i $selectedProductId1");
    //Get.snackbar('تحذير', 'الرجاء تحديد منتج واحد على الأقل');

    // ignore: avoid_print
    // print(
    //     "================hasCurrentProductWithCartCountOne m $hasCurrentProductWithCartCountOne");
    print("================companyNames m $companyNames");
    print("================selectedCompanyIds m $selectedCompanyIds");
    print("================selectedProductId1 m $selectedProductId1");

    print("couponid========m$couponid");
    print("priceorders ========m =$priceorders");
    print("discountcoupon========m$discountcoupon");
  }

  addCarCount(String id1, String serid, String catid, String prodid) async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    var response = await cardData.addCartCount(
        myServices.sharedPreferences.getString("id")!,
        id1,
        serid,
        catid,
        prodid);
    print("==========================addCarCount Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // saveValuesToSharedPreferences();
        // getValuesFromSharedPreferences();
        if (isCouponSelected.value && selectedValue != null) {
          viewDrop(serid);
        } else {
          myCart();
          isDropdownVisible.value = false;
          update();
          controllercoupon!.clear();
        }
        selectedProductId1 = prodid;
        selectedCategoreisIds = catid;
        // controller.myCart();
        print("selectedProductId1 ==$selectedProductId1");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeCarCount(String serid, String catid, String prodid) async {
    //data.clear();
    // otherCompanyIds = selectedCompanyIds != null ? [selectedCompanyIds!] : [];
    statusRequest = StatusRequest.loding;
    var response = await cardData.removeCartCount(
        myServices.sharedPreferences.getString("id")!, serid, catid, prodid);
    print("==========================removeCarCount Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        index;
        // List<String> companyIds = selectedCompanyIds!.split(",");
        // //companyIds.removeWhere((id) => id.trim() == serid);
        // companyIds.remove(serid);
        // selectedCompanyIds = companyIds.join(",");
        // //selectedCompanyIds = data[index!].cartSerid;
        if (isCouponSelected.value) {
          viewDrop(serid);
        } else {
          myCart();
        }
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeExitCarCount() async {
    //data.clear();
    statusRequest = StatusRequest.loding;
    var response = await cardData
        .removeExitCartCount(myServices.sharedPreferences.getString("id")!);
    print("==========================removeExitCarCount Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        index;
        if (isCouponSelected.value = true) {
          myCart();
        }

        //myCart();
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    myCart();
    super.onInit();
  }
}
/**hasCurrentProductWithCartCountOne = data.any((item) =>
              item.cartCount == "1" &&
              item.cartOrders == "0" &&
              item.cartId == id1 &&
              item.cartCatid == selectedCategoreisIds &&
              item.cartSerid == selectedCompanyIds &&
              item.cartId == id1); */
