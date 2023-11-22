import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/categories_data.dart';
import 'package:orop/data/datasource/remote/product_data.dart';
import 'package:orop/data/model/categoriesmodel.dart';
import 'package:orop/data/model/producttopselling_model.dart';
import 'package:orop/data/model/servicesmodel.dart';
import 'package:orop/linkapi.dart';

abstract class CategoriesController extends GetxController {
  initalData();
  changeSer(int val, String serval);
  getCategories(String serid);
  gotoPageCategoriesDetails(CategoriesModel categoriesModel);
  checkSubscribe();
}

class CategoriesControllerImp extends searchMixController {
  Icon subscribeIcon = Icon(Icons.notifications, size: 24);
  List services = [];
  List settingsdata = [];
  List datapts = [];
  String? serid;
  String categoryid = "4";
  int? selecedSer;
  ServicesModel? servicesModel;
  CategoriesModel? categoriesModel;
  CategoriesData categoriesData = CategoriesData(Get.find());
  ProductData productData = ProductData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  String subscribeTitle = "Follow";
  Color subscribeColor = Colors.blue;
  bool subbed = true;

  MyServices myServices = Get.find();

  @override
  initalData() async {
    services = Get.arguments['services'];
    selecedSer = Get.arguments['selectedser'];
    serid = Get.arguments['serid'];
    // statusRequest = StatusRequest.loding;
    getCategories(serid!);
    // statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    initalData();
    super.onInit();
  }

  changeSer(val, serval) {
    selecedSer = val;
    serid = serval;
    getCategories(serid!);
    update();
  }

  checkSubscribe() async {
    serid = Get.arguments['serid'];
    String userid = myServices.sharedPreferences.getString("id")!;
    statusRequest = StatusRequest.loding;
    var response = await categoriesData.checkSubscribeServiceData(serid!,userid);
    statusRequest = handlingData(response);
    print("==========================subscribed Controller $response ");
      if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("Subscribed done");
        subscribeTitle = "Followed";
        subscribeIcon = Icon(Icons.notifications_active, size: 24);
        subscribeColor = Colors.grey;
        subbed = false;
      } else {
        statusRequest = StatusRequest.failure;
        subbed = true;
      }
    }
    update();


  }

  subscribeService() async {
    serid = Get.arguments['serid'];
    String userid = myServices.sharedPreferences.getString("id")!;
    statusRequest = StatusRequest.loding;
    print("$serid $userid");
    var response = await categoriesData.subscribeServiceData(serid!,userid);
    statusRequest = handlingData(response);
    print("==========================subscribed Controller $response ");
      if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("Subscribed done");
        subscribeTitle = "Followed";
        subscribeIcon = Icon(Icons.notifications_active, size: 24);
        subscribeColor = Colors.grey;
        // List<String> subs = myServices.sharedPreferences.getStringList("subscribers")!;
        // subs.add(serid!);
        // myServices.sharedPreferences.setStringList("subscribers", subs);
        
        await FirebaseMessaging.instance.subscribeToTopic("$serid");
        subbed = false;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    print("1");
  }

  unSubscribeService() async {
    serid = Get.arguments['serid'];
    String userid = myServices.sharedPreferences.getString("id")!;
    statusRequest = StatusRequest.loding;
    var response = await categoriesData.unSubscribeServiceData(serid!,userid);
    statusRequest = handlingData(response);
    print("==========================unsubscribed Controller $response ");
      if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("unSubscribed done");
        subscribeTitle = "Follow";
        subscribeIcon = Icon(Icons.notifications, size: 24);
        subscribeColor = Colors.blue;
        // List<String> subs = myServices.sharedPreferences.getStringList("subscribers")!;
        // subs.remove(serid);
        // myServices.sharedPreferences.setStringList("subscribers", subs);

        await FirebaseMessaging.instance.unsubscribeFromTopic("$serid");
        subbed = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    print("2");
  }

  getCategories(serid) async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await categoriesData.getData(serid);
    print("==========================getCategories Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        await getSettings(serid!);
        await productTopSelling(serid!);
        await checkSubscribe();
        settingsdata;
      } else {
        await checkSubscribe();
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getSettings(serid) async {
    statusRequest = StatusRequest.loding;
    var response = await categoriesData.getSettingsData(serid);
    print("==========================getSettings Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        settingsdata.addAll(response['data']);
        print("=================$settingsdata");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    if (settingsdata.isEmpty) {
      settingsdata.add({
        'settings_titlehome': 'Discounts will\n',
        'settings_bodyhome': 'be added soon',
      });
      update();
    }

    update();
  }

//  Widget loadImage(String imageUrl) {
//   try {
//     return FutureBuilder<CachedNetworkImageProvider>(
//       future: DefaultCacheManager().getSingleFile(imageUrl).then((file) {
//         if (imageUrl.endsWith('.svg')) {
//           return CachedNetworkImageProvider(file.path);
//         } else {
//          // return null;
//         }
//       }),
//       builder: (BuildContext context,
//           AsyncSnapshot<Uint8List> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done &&
//             snapshot.hasData) {
//           if (imageUrl.endsWith('.svg')) {
//             // تم تحميل الصورة من نوع SVG بنجاح
//             return SvgPicture.memory(
//         snapshot.data!,
//         color: const Color.fromARGB(255, 103, 178, 240),
//         placeholderBuilder: (context) => CircularProgressIndicator(),
//       );
//           } else {
//             // تم تحميل الصورة من نوع غير SVG بنجاح
//             return Image(
//               image: snapshot.data!,
//               fit: BoxFit.contain,
//             );
//           }
//         } else if (snapshot.connectionState == ConnectionState.waiting) {
//           // قيد التحميل
//           return CircularProgressIndicator();
//         } else {
//           // حدث خطأ أثناء التحميل
//           return Text('Error loading image');
//         }
//       },
//     );
//   } catch (e) {
//     return Text('Error loading image: $e');
//   }
// }

  loadImage(String imageUrl) {
    try {
      if (categoriesModel!.categoriesImage! != null &&
          imageUrl != null &&
          imageUrl.isNotEmpty &&
          imageUrl.endsWith('.svg')) {
        return SvgPicture.network(
          imageUrl,
          color: const Color.fromARGB(255, 103, 178, 240),
          placeholderBuilder: (context) => CircularProgressIndicator(),
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) {
            return Image(
              image: imageProvider,
              fit: BoxFit.contain,
            );
          },
        );
      }
    } catch (e) {
      return Text('Error loading image: $e');
    }
  }

  productTopSelling(String sid) async {
    datapts.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await productData.productTopSelling(sid);
    print("==========================productTopSelling Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // datapts.clear();
        datapts.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoPageCategoriesDetails(categoriesModel) {
    Get.toNamed("categoriesdetails", arguments: {
      "categoriesmodel": categoriesModel,
    });
  }
}
