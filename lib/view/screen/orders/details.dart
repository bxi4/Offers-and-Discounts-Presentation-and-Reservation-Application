import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/orders/details_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HaindlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            const TableRow(children: [
                              Text(
                                'Categorie\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Product\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                Text(
                                    '${controller.data[index].categoriesName}\n',
                                    textAlign: TextAlign.center),
                                Text('${controller.data[index].productsName}\n',
                                    textAlign: TextAlign.center),
                                Text(
                                    '${controller.data[index].countiproduct}\n',
                                    textAlign: TextAlign.center),
                                Text('${controller.data[index].productprice}\n',
                                    textAlign: TextAlign.center),
                              ]),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "Price :  ${controller.ordersModel.ordersPrice}\$ \n",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
