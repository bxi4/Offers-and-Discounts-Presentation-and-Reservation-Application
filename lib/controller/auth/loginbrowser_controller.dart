import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orop/controller/browsercheck_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/core/services/services.dart';
import 'package:orop/data/datasource/remote/auth/login.dart';
import 'package:orop/data/datasource/remote/subscribe/allsubscribe_data.dart';

abstract class LoginBrowserController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginBrowserControllerImp extends LoginBrowserController {
  // bool userBrowsing = false;
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  var response;
  //late TextEditingController username;

  bool isshowpassword = true; //تابع اظهار واخفاء كلمة المرور
  //دالة اظهار واخفاء كلمة المرور

  MyServices myServices = Get.find();
  List<String> subscribedServices = [];

  StatusRequest statusRequest = StatusRequest.none;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

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
        for (int i = 0; i < dataRespond.length; i++) {
          String serviceID = dataRespond[i]['ser_id'];
        subscribedServices.add(serviceID);

          await FirebaseMessaging.instance.subscribeToTopic(serviceID);
          print("subscribed to $serviceID");
        }
        myServices.sharedPreferences
            .setStringList("subscribers", subscribedServices);

        // await FirebaseMessaging.instance.subscribeToTopic("$serid");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    print("1");
  }

  loginV2() async {
    statusRequest = StatusRequest.loding;
    update();
    response = await loginData.postdata(email.text, password.text);
    if (response['status'] == "success") {
      if (response['data']['users_approve'] == "1") {
        myServices.sharedPreferences
            .setString("id", response['data']['users_id']);

        await getAllSubscribers();
        String userid = myServices.sharedPreferences.getString("id")!;
        myServices.sharedPreferences
            .setString("username", response['data']['users_name']);
        myServices.sharedPreferences
            .setString("email", response['data']['users_email']);
        myServices.sharedPreferences
            .setString("phone", response['data']['users_phone']);

        myServices.sharedPreferences.setString("step", "3");
        //Get.offNamed(AppRoute.homepage);

        FirebaseMessaging.instance.subscribeToTopic("users");
        FirebaseMessaging.instance.subscribeToTopic("users${userid}");

        if (response['isService']) {
          myServices.sharedPreferences.setString(
              "services_id", response['service_data']['services_id']);

          myServices.sharedPreferences.setString(
              "services_name", response['service_data']['services_name']);
          myServices.sharedPreferences.setString(
              "services_name_ar", response['service_data']['services_name_ar']);
          myServices.sharedPreferences.setString(
              "services_image", response['service_data']['services_image']);
          myServices.sharedPreferences.setString(
              "services_date", response['service_data']['services_date']);
          myServices.sharedPreferences.setString("services_end_date",
              response['service_data']['services_end_date']);
          myServices.sharedPreferences.setString("step", "4");

          // Get.until((route) => Get.currentRoute == '/home');
          Get.offNamed(AppRoute.homescreenadmin);
        } else {
          Get.find<BrowsersCheck>().usersid.value = int.parse(response['data']['users_id']);
          Get.back();
        }
      } else {
        Get.toNamed(AppRoute.verfiyCodeSignUp,
            arguments: {"email": email.text});
      }
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "Email Or Password No Correct");
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  login() async {
    //var formdata = formstate.currentState;
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      response = await loginData.postdata(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == "1") {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id']);

            await getAllSubscribers();
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);

            myServices.sharedPreferences.setString("step", "3");
            //Get.offNamed(AppRoute.homepage);

            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            if (response['isService']) {
              myServices.sharedPreferences.setString(
                  "services_id", response['service_data']['services_id']);

              myServices.sharedPreferences.setString(
                  "services_name", response['service_data']['services_name']);
              myServices.sharedPreferences.setString("services_name_ar",
                  response['service_data']['services_name_ar']);
              myServices.sharedPreferences.setString(
                  "services_image", response['service_data']['services_image']);
              myServices.sharedPreferences.setString(
                  "services_date", response['service_data']['services_date']);
              myServices.sharedPreferences.setString("services_end_date",
                  response['service_data']['services_end_date']);
              myServices.sharedPreferences.setString("step", "4");

              // Get.until((route) => Get.currentRoute == '/home');
              Get.offNamed(AppRoute.homescreenadmin);
            } else {
              Get.back();
            }
          } else {
            Get.toNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password No Correct");
          // statusRequest = StatusRequest.failure;
        }
      }
      update();
      //التحقق من الحقول والايميل
    } else {
      print("not Valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    // userBrowsing = Get.arguments['userBrowering'] ?? false;
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
