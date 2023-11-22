import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/browsercheck_controller.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/productdetails_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/screen/auth/loginBrowser.dart';
import 'package:orop/view/widget/comments/customlistcomments.dart';
import 'package:orop/view/widget/comments/textformfield.dart';

class Comments extends GetView<CommentsController> {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeServerControllerImp serverControllerImp =
        Get.put(HomeServerControllerImp());
    ProductDetailsControllerImp controllerImp =
        Get.put(ProductDetailsControllerImp());
    BrowsersCheck controllerCheck = Get.put(BrowsersCheck());
    Get.put(CommentsController());
    return Scaffold(
      body: GetBuilder<CommentsController>(
          builder: (controller) => HaindlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        height: Get.height,
                        width: Get.width,
                        child: const CustomListComments(),
                      ),
                    ),
                    SizedBox(
                      height: 63,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.shade400))),
                              child: Obx(
                                () => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  width: MediaQuery.of(context).size.width,
                                  // width: Get.width,
                                  child: controllerCheck.userLoggedIn.value
                                      ? TextFormFieldText(
                                          hinTextForm: " ...اكتب تعليقًا",
                                          onPressed: () {
                                            controller.addComments(
                                                serverControllerImp.username!,
                                                controllerImp
                                                    .productsModel.servicesId!,
                                                controllerImp.productsModel
                                                    .categoriesId!,
                                                controllerImp
                                                    .productsModel.productsId!);
                                            controller.name.clear();
                                          })
                                      : ElevatedButton(
                                          onPressed: () {
                                            Get.to(() => LoginBrowser());
                                          },
                                          child: Text("Please login"),
                                        ))
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
