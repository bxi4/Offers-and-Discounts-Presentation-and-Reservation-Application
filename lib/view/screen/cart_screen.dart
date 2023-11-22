import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/view/widget/cartitems/appbarcart.dart';
import 'package:orop/view/widget/cartitems/custombottomscreen.dart';
import 'package:orop/view/widget/cartitems/customlistcartproduct.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return WillPopScope(
        onWillPop: () async {
          controller.removeExitCarCount();
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              elevation: 1.5,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  const Text(
                    "Your Orders",
                    style: TextStyle(color: Colors.black),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 270),
                    child: const AppBarCart(),
                  )
                ],
              ),
            ),
            body: GetBuilder<CartController>(
              builder: (controller) => HaindlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                              controller.isDropdownVisible.value ? 500 : 525,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 1),
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                controller.index = index;
                                return CustomListCartProduct(
                                    i: index,
                                    onAdd: () async {
                                      await controller.addCart(
                                          controller.data[index].productsId!,
                                          controller.data[index].cartSerid!,
                                          controller.data[index].cartCatid!);
                                      controller.refershPage();
                                    },
                                    onRemove: () async {
                                      await controller.deleteFromCart(
                                          controller.data[index].productsId!,
                                          controller.data[index].cartSerid!);
                                      controller.refershPage();
                                    },
                                    cartModel: controller.data[index],
                                    keyv: ValueKey(index.toString()),
                                    nameserv:
                                        "CO: ${controller.data[index].servicesName}",
                                    name:
                                        "${controller.data[index].productsName}",
                                    price:
                                        "${controller.data[index].productprice} \$",
                                    count:
                                        "${controller.data[index].countiproduct}",
                                    imagename:
                                        "${controller.data[index].productsImage}",
                                    onTaptop: () {
                                      if (controller.data[index].cartCount ==
                                          "0") {
                                        controller.addCarCount(
                                            controller.data[index].cartId!,
                                            controller.data[index].cartSerid!,
                                            controller.data[index].cartCatid!,
                                            controller.data[index].productsId!);
                                        controller.id1 =
                                            controller.data[index].cartId;
                                        controller.selectedCategoreisIds =
                                            controller.data[index].cartCatid;
                                        controller.selectedProductId1 =
                                            controller.data[index].cartProdid;
                                        controller.selectedCompanyIds =
                                            controller.data[index].cartSerid;
                                        controller.companyNames =
                                            controller.data[index].servicesName;
                                        controller.isCount =
                                            controller.data[index].cartCount;
                                        controller.isOrderCart =
                                            controller.data[index].cartOrders;
                                        controller.index = index;
                                        controller.update();
                                        // controller1.update();
                                      } else {
                                        controller.removeCarCount(
                                            controller.data[index].cartSerid!,
                                            controller.data[index].cartCatid!,
                                            controller.data[index].productsId!);
                                        controller.update();
                                      }

                                      controller.index = index;
                                      controller.id1 =
                                          controller.data[index].cartId;
                                      controller.selectedCategoreisIds =
                                          controller.data[index].cartCatid;
                                      controller.selectedProductId1 =
                                          controller.data[index].cartProdid;
                                      // controller.selectedCompanyIdsString =
                                      //     controller.selectedCompanyIds
                                      //         .join(controller.compid!);

                                      controller.selectedCompanyIds =
                                          controller.data[index].cartSerid!;
                                      controller.companyNames =
                                          controller.data[index].servicesName;
                                      controller.isCount =
                                          controller.data[index].cartCount;
                                      controller.isOrderCart =
                                          controller.data[index].cartOrders;
                                      controller.update();
                                    },
                                    child: Row(
                                      children: [
                                        controller.data[index].cartCount == "0"
                                            ? const SizedBox.shrink()
                                            : Icon(Icons.check_circle,
                                                color: Colors.blue.shade700),
                                      ],
                                    )

                                    // isSelected
                                    //     ? const Icon(Icons.check_circle)
                                    //     : const SizedBox(),
                                    //isSelected: isSelected,
                                    // onTaptop:
                                    );
                              }),
                        ),
                        CustomBottomScreen(
                          controllercoupon: controller.controllercoupon!,
                          onApplyCoupon: () async {
                            if (controller.isCouponSelected.value) {
                              if (controller.selectedCompanyIds != null &&
                                  controller.isCount != null) {
                                if (controller.selectedSerid != null) {
                                  await controller
                                      .checkcoupon(controller.selectedSerid!);
                                  print(
                                      "==========E${controller.selectedSerid}");
                                } else {
                                  Get.snackbar("!تنبيه",
                                      "هناك مشكلة في اختيارك الرجاء التاكد من الشركة والمنتجات انه تابعة للكوبون المحدد");
                                }
                              } else {
                                Get.snackbar("!تنبيه",
                                    " الرجاء النقر فوق المنتجات التي ترغب بها");
                              }
                            } else {
                              Get.snackbar("!تنبيه",
                                  " الرجاء اختار الشركة المحددة للكوبون من القائمة التي ظهرت للانتقال بامان");
                            }
                          },
                          discount: "${controller.discountcoupon}%",
                          price: "${controller.priceorders}",
                          totalprice: "${controller.getTotalPrice()}",
                          onPressedTap: () {
                            controller.goToPageCheckout();
                          },
                        )
                      ],
                    ),
                  )),
            )));
  }
}
