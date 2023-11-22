import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:orop/controller/cart/cart_controller.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/productdetails_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/constant/imageasset.dart';
import 'package:orop/data/model/cardmodel.dart';
import 'package:orop/linkapi.dart';

class CustomListCartProduct extends GetView<CartController> {
  final CartModel cartModel;
  final String name;
  final int? i;
  final String nameserv;
  final String price;
  final String count;
  final Function()? onTaptop;
  // final Icon? icon;
  final Widget? child;
  //final String serversId;
  //final bool isSelected = false; // تم إضافة حالة لتتحكم في إظهار العلامة التحقق
  final RxBool isSelected = false.obs;
  //final RxBool isSelected ;
  // إنشاء متغير RxInt لتخزين معرف المنتج المحدد
  // final RxInt selectedProductId = 0.obs;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  final Key keyv;
  CustomListCartProduct({
    Key? key,
    this.i,
    required this.cartModel,
    required this.keyv,
    required this.name,
    required this.price,
    required this.imagename,
    required this.nameserv,
    required this.onAdd,
    required this.onRemove,
    required this.count,
    this.child,
    this.onTaptop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.index = i!;
    //controller.isSelected1 = isSelected;
    // ProductDetailsControllerImp controllerImp =
    //     Get.put(ProductDetailsControllerImp());
    // controller.cartModel = cartModel;
    Get.put(CartController());
    return Slidable(
      key: keyv,
      actionPane: const SlidableScrollActionPane(),
      actionExtentRatio: 0.19,
      showAllActionsThreshold: 0.5,
      secondaryActions: [
        InkWell(
          onTap: () {
            controller.deleteallqua(cartModel.cartProdid!);
            controller.refershPage();
          },
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            //width: 10,
            height: 127,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      controller.deleteallqua(cartModel.cartProdid!);
                      //controller.refershPage();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
                const Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
      child: InkWell(
        onTap: onTaptop,

        //  () {
        //   isSelected.toggle();
        //   // controller.selecedSer = index;
        //   //controller.selecedSer = isSelected ? -1 : index;

        //   //controller.update();
        // },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
              height: 120,
              width: 410,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                      tag: "${cartModel.productsId}",
                      child: GetBuilder<FavoriteController>(
                          builder: (controlerF) => Stack(
                                children: [
                                  Container(
                                    height: 110,
                                    width: 130,
                                    margin: const EdgeInsets.only(left: 7),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            "${AppLink.imagestProduct}/$imagename"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  // CircularProgressIndicator(),
                                  if (cartModel.productsDiscount != "0")
                                    Positioned(
                                        top: 1,
                                        left: 8,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          maxRadius: 14,
                                          child: Image.asset(
                                            AppImageAsset.saleOne,
                                            width: 24,
                                          ),
                                        )),
                                ],
                              ))),
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, left: 10),
                          child: Text(
                            nameserv,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, left: 10),
                          child: Text(
                            name,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        //const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            price,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 42,
                            child: IconButton(
                              onPressed: onRemove,
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26,
                            child: Text(
                              count,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 37,
                            child: IconButton(
                              onPressed: onAdd,
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Stack(
              children: [
                // Obx(() {
                //   return isSelected.value
                //       ? Container(
                //           padding: const EdgeInsets.only(left: 370, top: 18),
                //           child: Icon(
                //             Icons.check_circle,
                //             color: Colors.blue.shade700,
                //           ))
                //       : const SizedBox.shrink();
                // }),
                Container(
                  padding: const EdgeInsets.only(left: 370, top: 18),
                  child: child,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
