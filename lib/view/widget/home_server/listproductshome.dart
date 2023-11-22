import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/categories_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/linkapi.dart';
import 'package:orop/view/widget/categories/customtitlehome.dart';
import 'package:orop/view/widget/home_server/customimageads.dart';
import 'package:orop/view/widget/home_server/listserviceshomeserver.dart';

class ListProductsHome extends GetView<HomeServerControllerImp> {
  const ListProductsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(ProductControllerImp());
    //Get.put(HomeServerControllerImp());

    //  SizedBox(
    //   height: 140,
    //   child: ListView.builder(
    //       itemCount: controller.products.length,
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (context, i) {
    //         return ProductHome(
    //             i: i,
    //             productsModel: ProductsModel.fromJson(controller.products[i]));
    //       }),
    // );

    final GlobalKey<NestedScrollViewState> _nestedScrollViewKey =
        GlobalKey<NestedScrollViewState>();
    return Scaffold(
      body: NestedScrollView(
        key: _nestedScrollViewKey,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              forceElevated: true,
              // floating: true,
              pinned: true,
              backgroundColor: Colors.white.withOpacity(1),
              expandedHeight: 260,
              toolbarHeight: 1,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  child: const CustomImageAds(),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          shrinkWrap: true,
          dragStartBehavior: DragStartBehavior.down,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: MyPersistentHeaderDelegate(),
            ),
            // SliverPadding(
            //   padding: const EdgeInsets.all(16.0),
            //   sliver: SliverGrid(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       childAspectRatio: 1.0,
            //     ),
            //     delegate: SliverChildBuilderDelegate(
            //       (BuildContext context, int index) {
            //         return Container(
            //           color: Colors.blueGrey,
            //           height: 100.0,
            //           width: 100.0,
            //           child: Text('عنصر $index'),
            //         );
            //       },
            //       childCount: 10,
            //     ),
            //   ),
            // ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  return ProductHome(
                      i: i,
                      productsModel:
                          ProductsModel.fromJson(controller.products[i]));
                },
                childCount: controller.products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductHome extends GetView<HomeServerControllerImp> {
  final ProductsModel productsModel;
  final int? i;
  const ProductHome({
    Key? key,
    required this.productsModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(CategoriesControllerImp());
    HomeServerControllerImp controller1 = Get.put(HomeServerControllerImp());
    return InkWell(
      onTap: (() {
        controller1.gotoPageProductDetails1(productsModel, i!);
      }),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imagestProduct}/${productsModel.productsImage}",
              height: 100,
              width: 180,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: AppColor.grey),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.black26,
              color: const Color.fromARGB(255, 96, 128, 153).withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              top: 10,
              child: Text(
                "${productsModel.productsName}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      // height: 100,
      color: Colors.white.withOpacity(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomTitleHome(title: "  Companies"),
          ListServicesHomeServer(),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 157.0;

  @override
  double get minExtent => 157.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
