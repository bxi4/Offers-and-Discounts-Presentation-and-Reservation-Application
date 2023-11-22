import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/products/view_controller.dart';
import 'package:orop/linkapi.dart';
import 'package:orop/view/widget/admin_services/customappbar.dart';
import 'package:orop/view/widget/admin_services/customfloatingactionbutton.dart';

class AdminServicesProductsView extends StatelessWidget {
  const AdminServicesProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminServicesProductsController controller =
        Get.put(AdminServicesProductsController());
    return Scaffold(
        appBar: CustomAppBarAdmin2("Products"),
        floatingActionButton: customFloatingActionButton(),
        body: GetBuilder<AdminServicesProductsController>(
            builder: ((controller) => WillPopScope(
                  onWillPop: () {
                    return controller.myback();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.gotoPageEdit(controller.data[index]);
                            },
                            child: Card(
                                child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: CachedNetworkImage(
                                        height: 95,
                                        imageUrl:
                                            "${AppLink.imagestProduct}/${controller.data[index].productsImage}"),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 5),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              icon: const Icon(Icons
                                                  .delete_forever_outlined),
                                              onPressed: () {
                                                Get.defaultDialog(
                                                    title: "تحذير",
                                                    middleText:
                                                        "هل انت متاكد من عملية الحذف",
                                                    onCancel: () {},
                                                    onConfirm: () {
                                                      controller.deleteProducts(
                                                          controller.data[index]
                                                              .productsId!,
                                                          controller.data[index]
                                                              .productsImage!);
                                                      Get.back();
                                                    });
                                              }),
                                          // IconButton(
                                          //     icon: const Icon(Icons.edit),
                                          //     onPressed: () {
                                          //       controller.gotoPageEdit(
                                          //           controller.data[index]);
                                          //     }),
                                        ],
                                      ),
                                      subtitle: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(controller
                                            .data[index].categoriesName!),
                                      ),
                                      title: Text(
                                        controller.data[index].productsName!,
                                      ),
                                    )),
                              ],
                            )),
                          );
                        }),
                  ),
                ))));
  }
}
