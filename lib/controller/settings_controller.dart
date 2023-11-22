import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/subscribe/allsubscribe_data.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool serviceDashboardVisibility = false;
  bool disableNotifications = false;

  @override
  void onInit() {
    disableNotifications = myServices.sharedPreferences.getBool("disableNotifications") ?? false;
    checkService();
    super.onInit();
  }

  checkService() {
    if (myServices.sharedPreferences.getString("services_id") != null) {
      serviceDashboardVisibility = true;
    }
    update();
  }

  disableNotificationFunction() {
    disableNotifications = !disableNotifications;
    myServices.sharedPreferences.setBool("disableNotifications",disableNotifications);
    print(disableNotifications);
    update();
  }
  
  late StatusRequest statusRequest;
  AllSubsData allSubsData = AllSubsData(Get.find());

    getAllSubscribers() async {
    String userid = myServices.sharedPreferences.getString("id")!;
    statusRequest = StatusRequest.loding;
    var response = await allSubsData.getData(userid);
    statusRequest = handlingData(response);
    print("==========================subscribed Controller $response ");
      if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var dataRespond = response['data'];
        for(int i = 0; i < dataRespond.length ; i++){
          String serviceID = dataRespond[i]['ser_id'];
          await FirebaseMessaging.instance.unsubscribeFromTopic(serviceID);
          print("Unsubscribed $serviceID");
        }
        
        // await FirebaseMessaging.instance.subscribeToTopic("$serid");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    print("1");
  }

  logout() async {
    // List<String> subscribersList = myServices.sharedPreferences.getStringList("subscribers")!;
    await getAllSubscribers();
    // if(subscribersList != null) {
    //   for(int i = 0 ; i < subscribersList.length ; i++){
    //       await FirebaseMessaging.instance.unsubscribeFromTopic(subscribersList[i]);
    //       print("unsubscribed from ${subscribersList[i]}");
    // }
    // }
    var usersid = int.parse(myServices.sharedPreferences.getString("id")!);
    if (usersid == 22) {
      sinUptoApp();
    } else {
      String userid = myServices.sharedPreferences.getString("id")!;
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
      myServices.sharedPreferences.clear();
      Get.offAllNamed(AppRoute.login);
    }
  }
}
