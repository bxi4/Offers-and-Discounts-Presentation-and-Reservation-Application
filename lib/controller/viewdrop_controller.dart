// import 'package:get/get.dart';
// import 'package:orop/core/class/statusrequest.dart';
// import 'package:orop/core/functions/handlingdatacontroller.dart';
// import 'package:orop/core/services/services.dart';
// import 'package:orop/data/datasource/remote/cart_data.dart';
// import 'package:orop/data/model/cardmodel.dart';

// class ViewDropController extends GetxController {
//   String? selectedValue;
//   MyServices myServices = Get.find();
//   CardData cardData = CardData(Get.find());
//   late StatusRequest statusRequest;
//   List<CartModel> data = [];

//   viewDrop() async {
//     //data.clear();
//     statusRequest = StatusRequest.loding;
//     var response =
//         await cardData.viewDrop(myServices.sharedPreferences.getString("id")!);
//     // ignore: avoid_print
//     print("========================== ViewDrop $response ");
//     statusRequest = handlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
        // List responsedata = response['data'];
        // data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
//         //data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   void setSelectedValue(String value) {
//     selectedValue = value;
//     update();
//   }

//   addServiceToCart() {
//     if (selectedValue == null) {
//       // لم يتم اختيار أي قيمة بعد
//       return;
//     }
//     // استخدم selectedValue هنا
//     print("The selected value is: $selectedValue");
//     // ...
//   }

//   @override
//   void onInit() {
//     viewDrop();
//     super.onInit();
//   }
// }
