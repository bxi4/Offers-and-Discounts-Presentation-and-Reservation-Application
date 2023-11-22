import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:orop/controller/settings_controller.dart' as userSettings;
import 'package:orop/controller/orders/pending_controller.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:path_provider/path_provider.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

Future<void> _firebaseOnBackGroundMessageHandler(RemoteMessage message) async {

  // if(!Get.find<userSettings.SettingsController>().disableNotifications) {
  print("================= Notification ==============");
  String imageName = message.data['imageName'];
  String notificationTitle = message.data['notificationTitle'];
  String notificationBody = message.data['notificationBody'];
  String productData = message.data['productData'];
  String imageUrl =
      "https://sultankinggd.000webhostapp.com/orop_ecommerce/upload/products/$imageName";
  final response = await http.get(Uri.parse(imageUrl));
  final bytes = response.bodyBytes;

  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/image.jpg');
  await file.writeAsBytes(bytes);

  print(message.data);
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 1,
    channelKey: "service_image",
    // title: message.notification?.title,
    title: notificationTitle,
    // body: message.notification?.body,
    body: notificationBody,
    notificationLayout: NotificationLayout.BigPicture,
    bigPicture: 'file://${file.path}',
    payload: { "productData": productData}
  ));

  FlutterRingtonePlayer.playNotification();
  // Get.snackbar(message.notification!.title!, message.notification!.body!);
  refreshPageNotification(message.data);
  // } else {
  //   print("Disabled");
  // }
}

fcmconifg() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseOnBackGroundMessageHandler);

    FirebaseMessaging.onMessage.listen(_firebaseOnBackGroundMessageHandler);
}

refreshPageNotification(data) {
  print("==================== page id");
  print(data['pageid']);
  print("==================== page name");
  print(data['pagename']);
  print("==================== Gurrent Route");
  print(Get.currentRoute);
  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    //print("refresh order =======================");
    OrdersPendingController controller = Get.find();
    controller.refreshorder();
  }
}
