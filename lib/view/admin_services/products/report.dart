import 'package:badges/badges.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orop/controller/adminservices/products/report_controller.dart';
import 'package:orop/controller/adminservices/products/view_controller.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/view/widget/admin_services/customappbar.dart';
import 'package:orop/view/widget/admin_services/reports/reportslist.dart';

class reportView extends StatelessWidget {
  const reportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepoetsController controller = Get.put(RepoetsController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBarAdmin2("Reports"),
        body: Card(
          color: Colors.grey[200], // لون الخلفية
          elevation: 4, // الظل الخارجي
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(() => Container(
                            height: 72,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat("dd-MM-yyyy")
                                          .format(controller.selectedDate.value)
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 140,
                                      child: NeumorphicButton(
                                        onPressed: () {
                                          controller.chooseDate();
                                        },
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.flat,
                                          depth: 8,
                                          lightSource: LightSource.topLeft,
                                          color: Colors.blue[300],
                                        ),
                                        child: Text("الى تاريخ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    color: Colors.blue.shade900,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 4,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                fontFamily: "Cairo",
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        // style: ElevatedButton.styleFrom(
                                        //   primary:
                                        //       Colors.blue.shade400, // لون الزر
                                        //   elevation: 0,
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Obx(() => Container(
                            height: 72,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat("dd-MM-yyyy")
                                          .format(
                                              controller.selectedDate1.value)
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 140,
                                      child: NeumorphicButton(
                                          onPressed: () {
                                            controller.chooseDate1();
                                          },
                                          style: NeumorphicStyle(
                                            // shape: NeumorphicShape.flat,
                                            depth: 8,
                                            lightSource: LightSource.topLeft,
                                            color: Colors.blue[300],
                                          ),
                                          child: Text("من تاريخ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                      color:
                                                          Colors.blue.shade900,
                                                      offset: Offset(2, 2),
                                                      blurRadius: 4,
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  fontFamily: "Cairo",
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    padding: EdgeInsets.only(top: 50),
                    child: NeumorphicButton(
                        onPressed: () {
                          controller.getData(
                              controller.selectedDate1.value.toString(),
                              controller.selectedDate.value.toString());

                          print(
                              "====selectedDate1 = ${controller.selectedDate1.value.toString()} AND selectedDate= ${controller.selectedDate.value.toString()}");
                        },
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 8,
                          lightSource: LightSource.topLeft,
                          color: Colors.blue[300],
                        ),
                        child: Center(
                          child: Text("تنفيذ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.blue.shade900,
                                    offset: Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                                fontFamily: "Cairo",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        )),
                  ),
                  Divider(color: Colors.grey.shade400, thickness: 2),
                  GetBuilder<RepoetsController>(
                      builder: (controller) => ListProductsReport(
                            listdatamodel: controller.data,
                          ))
                ],
              )),
        ),
      ),
    );
  }
}
