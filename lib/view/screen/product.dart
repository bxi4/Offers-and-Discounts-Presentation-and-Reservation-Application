import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/favorite_controller.dart';
import 'package:orop/controller/products_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/routes.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/view/screen/home_server.dart';
import 'package:orop/view/widget/customappbar.dart';
import 'package:orop/view/widget/products/customlistproducts.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());
    FavoriteController controllfav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controller.search!,
              titleappbar: "Search",
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onPressedIcon: () {
                Get.toNamed(AppRoute.myfavorite);
                Get.delete<FavoriteController>();
              },
            ),
            const SizedBox(height: 20),
            GetBuilder<ProductControllerImp>(
                builder: (controller) => HaindlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.7),
                            itemBuilder: (BuildContext context, index) {
                              controllfav.isFavorite[controller.data[index]
                                      ['products_id']] =
                                  controller.data[index]['favorite'];
                              return CustomListProducts(
                                  productsModel: ProductsModel.fromJson(
                                      controller.data[index]));
                            })
                        : ListProductsSearch(
                            listdatamodel: controller.listdata)))
          ],
        ),
      ),
    );
  }
}
