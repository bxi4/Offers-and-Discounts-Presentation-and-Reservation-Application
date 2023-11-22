import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orop/controller/adminservices/orders/details_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';

class AdminServicesOrdersDetails extends StatelessWidget {
  const AdminServicesOrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminServicesOrdersDetailsController controller =
        Get.put(AdminServicesOrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<AdminServicesOrdersDetailsController>(
              builder: (controller) => HaindlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Table(
                                children: [
                                  const TableRow(children: [
                                    Text(
                                      'Product\n',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('QTY\n',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    Text('Price\n',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                                  // TableRow(children: [
                                  //   Text('Macbook m1\n',
                                  //       textAlign: TextAlign.center),
                                  //   Text('2\n', textAlign: TextAlign.center),
                                  //   Text('1200\n', textAlign: TextAlign.center),
                                  // ]),
                                  ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(children: [
                                      Text(
                                          '${controller.data[index].productsName}\n',
                                          textAlign: TextAlign.center),
                                      Text(
                                          '${controller.data[index].countiproduct}\n',
                                          textAlign: TextAlign.center),
                                      Text(
                                          '${controller.data[index].productsPrice}\n',
                                          textAlign: TextAlign.center),
                                    ]),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    "Price : ${controller.ordersModel.ordersPrice}\$ \n",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //SizedBox(height: 10),

                      // if (controller.ordersModel.ordersType == "0")
                      //   Card(
                      //     child: Container(
                      //       child: ListTile(
                      //         title: const Text('Shipping Address \n',
                      //             style: TextStyle(
                      //                 color: AppColor.primaryColor,
                      //                 fontWeight: FontWeight.bold)),
                      //         subtitle: Text(
                      //             '${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}\n'),
                      //       ),
                      //     ),
                      //   ),

                      // if (controller.ordersModel.ordersType == "0")
                      //   Card(
                      //     child: Container(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 10),
                      //       height: 300,
                      //       width: double.infinity,
                      //       //Googel Map هنا
                      //       child: GoogleMap(
                      //         mapType: MapType.normal,
                      //         initialCameraPosition: controller.cameraPosition!,
                      //         onTap: (latlong) {},
                      //         //initialCameraPosition: ,
                      //         onMapCreated:
                      //             (GoogleMapController controllermap) {
                      //           controller.completercontroller!
                      //               .complete(controllermap);
                      //         },
                      //       ),
                      //     ),
                      //   ),
                    ]),
                  ))),
    );
  }
}
