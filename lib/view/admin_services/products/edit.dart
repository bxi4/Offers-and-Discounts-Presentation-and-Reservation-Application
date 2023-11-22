import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/products/edit_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/functions/vaildinput.dart';
import 'package:orop/core/shared/custombutton.dart';
import 'package:orop/core/shared/customdropdownsearch.dart';
import 'package:orop/core/shared/customtextformglobal.dart';

class AdminServicesProductsEdit extends StatelessWidget {
  const AdminServicesProductsEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminServicesProductsEditController controller =
        Get.put(AdminServicesProductsEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Products"),
        ),
        body: GetBuilder<AdminServicesProductsEditController>(
            builder: (controller) => HaindlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.all(12),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hinttext: "Products Name",
                              labeltext: "Products Name",
                              iconData: Icons.category,
                              mycontroller: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Products Name ( Arabic )",
                              labeltext: "Products Name ( Arabic )",
                              iconData: Icons.category,
                              mycontroller: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Desc name",
                              labeltext: "Desc name",
                              iconData: Icons.category,
                              mycontroller: controller.desc,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Descar name ( Arabic )",
                              labeltext: "Descar name ( Arabic )",
                              iconData: Icons.category,
                              mycontroller: controller.descar,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hinttext: "Count",
                              labeltext: "Count",
                              iconData: Icons.category,
                              mycontroller: controller.count,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: "Price",
                              labeltext: "Price",
                              iconData: Icons.category,
                              mycontroller: controller.price,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hinttext: "discount",
                              labeltext: "discount",
                              iconData: Icons.category,
                              mycontroller: controller.discount,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomDropDownSearch(
                              title: "Choose Category",
                              listdata: controller.deopdownlist,
                              dropdownSelectedName: controller.catname!,
                              dropdownSelectedID: controller.catid!),
                          const SizedBox(height: 10),
                          RadioListTile(
                              title: const Text("hidde"),
                              value: "0",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changeStatusActive(val);
                              }),
                          RadioListTile(
                              title: const Text("active"),
                              value: "1",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changeStatusActive(val);
                              }),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.thirdColor,
                              textColor: AppColor.secondColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                controller.showOptionImage();
                              },
                              child: const Text("Choose Products image"),
                            ),
                          ),
                          if (controller.file != null)
                            Image.file(controller.file!),
                          CustomButton(
                              text: "Save",
                              onPressed: () {
                                controller.editData();
                              })
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
