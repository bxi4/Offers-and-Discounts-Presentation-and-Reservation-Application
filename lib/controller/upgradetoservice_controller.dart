import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/functions/handlingdatacontroller.dart';
import 'package:orop/data/datasource/remote/servicetype_data.dart';
import 'package:orop/view/screen/upgradetoservice_screen1.dart';
import 'package:orop/view/widget/upgrade_to_service/custombutton.dart';

class UpdgradeToSeriveController extends GetxController {
  late BuildContext context;

  UpdgradeToSeriveController({required this.context});

  List<Widget> items = [];
  ServiceType serviceType = ServiceType(Get.find());
  late StatusRequest statusRequest;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await serviceType.getTypes();
    print("========================== Controller $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var responseData = response['data'];
        for (int i = 0; i < responseData.length; i++) {
          items.add(dataWidget(
              responseData[i]["service_type_id"],
              responseData[i]["service_type_name"],
              responseData[i]["service_type_desc"],
              responseData[i]["service_type_price"].toString()));
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  Widget dataWidget(
      String planID, String planName, String planDesc, String planPrice) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
              Colors.blue.shade300,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(planName,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold))),
              const Divider(
                endIndent: 20,
                thickness: 1,
                indent: 20,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Text("$planPrice YER",
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Text(planDesc, style: const TextStyle(fontSize: 18)),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 50),
                // height: 50,
                //  width: 0,
                child: CustomButtonServicePlan(
                  buttonText: "Order this plan",
                  onPressed: () {
                    Get.to(() => UpgradeToServiceScreen1(
                        servicePlanID: planID,
                        servicePlanName: planName,
                        servicePlanDesc: planDesc,
                        servicePlanPrice: planPrice));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
