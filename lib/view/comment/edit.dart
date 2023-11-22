import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/controller/productdetails_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/widget/comments/customeditcommet.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp =
        Get.put(ProductDetailsControllerImp());
    Get.put(CommentsController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<CommentsController>(
          builder: (controller) => HaindlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(10),
                  child: const EditComment(),
                ),
              )),
    );
  }
}
