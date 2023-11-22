import 'package:dartz/dartz.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/model/cardmodel.dart';
import 'package:orop/view/widget/cartitems/custombuttoncoupon.dart';

class CustomBottomScreen extends GetView<CartController> {
  final String discount;
  final String price;
  final void Function()? onApplyCoupon;
  final TextEditingController controllercoupon;
  final String totalprice;
  final void Function()? onPressedTap;
  // final Object? value;
  // final List<DropdownMenuItem<Object>>? items;
  const CustomBottomScreen({
    Key? key,
    required this.discount,
    this.onApplyCoupon,
    required this.controllercoupon,
    required this.price,
    required this.totalprice,
    required this.onPressedTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CartController controller = Get.put(CartController());
    //ViewDropController dropController = Get.put(ViewDropController());
    String v;
    controller.data;
    List<CartModel> data1 = controller.data.toSet().toList();
    return GetBuilder<CartController>(
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponname == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      // margin: const EdgeInsets.only(bottom: 2),
                      child: Column(
                        children: [
                          // Container(
                          //   //width: 250,
                          //   //height: 50,
                          //   color: AppColor.grey,
                          //   child:
                          Obx(() {
                            //   if (controller.isDropdownVisible.value) {
                            return Visibility(
                                visible: controller.isDropdownVisible.value,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      // child: Flexible(
                                      //   flex: 1,
                                      //   // width: 381,
                                      child: SizedBox(
                                        width: 381,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            barrierLabel: "Services Name",
                                            iconStyleData: const IconStyleData(
                                                iconEnabledColor:
                                                    AppColor.black,
                                                iconSize: 40),
                                            dropdownStyleData:
                                                DropdownStyleData(
                                                    maxHeight: 200,
                                                    width: 380,
                                                    padding: null,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            AppColor.thirdColor,
                                                        border: Border.all(
                                                            color: AppColor
                                                                .thirdColor)),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all(false),
                                                    )),
                                            menuItemStyleData:
                                                const MenuItemStyleData(
                                              height: 40,

                                              // padding:
                                              //     EdgeInsets.only(left: 14, right: 14),
                                            ),
                                            value: controller.selectedValue,
                                            onChanged:
                                                (String? newValue) async {
                                              if (controller
                                                      .hasCurrentProductWithCartCountOne ==
                                                  true) {
                                                // Remove the selected item
                                                controller.removeExitCarCount();
                                                controller.selectedValue = null;
                                                Get.snackbar("!تنبيه",
                                                    "عندى استخدام الشفرة لايمكن تحديد المنتجات قبل اختيار الشركة المحدده لشفرة");
                                              } else {
                                                controller.selectedValue =
                                                    newValue!;
                                                controller.selectedSerid =
                                                    controller.data
                                                        .firstWhere((element) =>
                                                            element
                                                                .servicesName ==
                                                            newValue)
                                                        .cartSerid!;
                                                await controller.viewDrop(
                                                    controller.selectedSerid);

                                                controller.isCouponSelected
                                                    .value = true;
                                              }
                                            },
                                            buttonStyleData: ButtonStyleData(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color:
                                                        AppColor.primaryColor,
                                                    width: 1.8),
                                              ),
                                            ),
                                            items: controller.data
                                                .map((e) => e.servicesName!)
                                                .toSet()
                                                .map<DropdownMenuItem<String>>(
                                                    (value) {
                                              BorderRadius.circular(10);
                                              Border.all(color: Colors.red);
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value,
                                                      style: const TextStyle(
                                                          decorationColor:
                                                              AppColor
                                                                  .primaryColor),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    const Divider(
                                                        color: AppColor.grey,
                                                        height: 1),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      // ),
                                    )
                                  ],
                                ));

                            //   } else {
                            //     return const SizedBox.shrink();
                            //   }
                          }),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: controllercoupon,
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 10),
                                        hintText: "Coupon Code",
                                        border: OutlineInputBorder()),
                                    onChanged: (value) {
                                      controller
                                          .updateDropdownVisibility(value);
                                    },
                                  )),
                              const SizedBox(width: 5),
                              Expanded(
                                flex: 1,
                                child: CustomButtonCoupon(
                                  textbutton: "apply",
                                  onPressed: onApplyCoupon,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Coupon Code:  ${controller.couponname!}",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            width: 385,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColor.primaryColor, width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Price", style: TextStyle(fontSize: 16)),
                    Text("$price", style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("discount", style: TextStyle(fontSize: 16)),
                    Text("$discount", style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\YER $totalprice",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.5),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 57,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                            primary: AppColor.primaryColor,
                          ),
                          onPressed: onPressedTap,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Submit Requests",
                                //"Check Out",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.shopping_cart),
                            ],
                          )),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
