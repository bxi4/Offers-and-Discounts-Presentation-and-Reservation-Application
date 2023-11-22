// @dart=2.9
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/bindings/initialbindings.dart';
import 'package:orop/core/localization/changeloacal.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    AwesomeNotifications().initialize(
  // set the icon to null if you want to use the default app icon
  "resource://drawable/launch_background",
  [
    NotificationChannel(
        channelKey: 'service_image',
        channelName: 'service_image notifications',
        channelDescription: 'Notification channel for service_image tests',)
  ],
  debug: true
);

startListeningNotificationEvents();


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
      //home: const Browsersbording(),
      //routes: routes,
      getPages: routes,
    );
  }
}


  Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }
  
  @pragma('vm:entry-point')
  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) {
    ProductsModel productsModel = ProductsModel();
    print("Tappppppppppppppppped");
    var data = receivedAction.payload;
    String productDataString = data['productData'];
    var productData = json.decode(productDataString);
    double productPrice = double.parse(productData['products_price']);
    double productDiscount = double.parse(productData['products_discount']);
    // print("------------------DATAAAAAAAAAAAAAA---------------- $productPrice $productDiscount");
    double discount =  productPrice - ((productDiscount / 100) * productPrice) ;
    // double productAllPrice = double.parse(productPrice) - discount;
    productData['productpricecount']= discount.toString();
    print("$discount $productData");
    productsModel = ProductsModel.fromJson(productData);
    Get.toNamed("/productdetails", arguments: {
      "productsModel2": productsModel,
    });
    // Get.to(() => BuilderScreen(), arguments: {
    //   "productsModel": productsModel,
    // });
  }