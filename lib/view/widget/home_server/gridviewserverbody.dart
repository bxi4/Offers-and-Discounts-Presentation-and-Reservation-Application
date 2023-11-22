import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/data/model/servicesmodel.dart';
import 'package:orop/linkapi.dart';
import 'package:orop/view/widget/categories/customtitlehome.dart';
import 'package:orop/view/widget/home_server/customimageads.dart';

class GridViewServerBody extends GetView<HomeServerControllerImp> {
  const GridViewServerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: controller.services.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ServicesBody(
              servicesModel: ServicesModel.fromJson(controller.services[i]),
            );
          },
        ));

    // GridView.builder(
    //     scrollDirection: Axis.vertical,
    //     itemCount: controller.services.length,
    //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //       childAspectRatio: 0.8,
    //       //mainAxisSpacing: 9.0,
    //       crossAxisSpacing: 6.0,
    //       maxCrossAxisExtent: 200,
    //     ),
    //     itemBuilder: (context, i) {
    //       return ServicesBody(
    //         servicesModel: ServicesModel.fromJson(controller.services[i]),
    //       );
    //     });

    // CustomScrollView(
    //     // scrollDirection: Axis.vertical,
    //     // reverse: false,
    //     slivers: [
    //   SliverAppBar(
    //     expandedHeight: 270,
    //     flexibleSpace: FlexibleSpaceBar(
    //       background: Container(
    //         //width: 450,
    //         //height: 220,
    //         color: Colors.white,
    //         child: CustomImageAds(),
    //       ),
    //     ),
    //   ),
    //   // SizedBox(height: 10, width: 10, child: Text("data")),
    //   SliverGrid(
    //       delegate: SliverChildBuilderDelegate(
    //         (BuildContext context, index) {
    //           return ServicesBody(
    //             servicesModel:
    //                 ServicesModel.fromJson(controller.services[index]),
    //           );
    //         },
    //         childCount: controller.services.length,
    //       ),
    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //           childAspectRatio: 0.8,
    //           crossAxisSpacing: 9.0,
    //           maxCrossAxisExtent: 200))
    // ]);
  }
}

class ServicesBody extends GetView<HomeServerControllerImp> {
  final ServicesModel servicesModel;
  final Function()? onTapOn;
  // final String text;
  const ServicesBody({Key? key, required this.servicesModel, this.onTapOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapOn,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${AppLink.imagestServices}/${servicesModel.servicesImage}",
                  //fit: BoxFit.cover,
                  height: 90,
                  width: 150,
                ),
              ),
            ),
            Container(
              height: 16,
              width: 150,
              // margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Expanded(
                  flex: 1,
                  child: Text(
                    "${servicesModel.servicesName}",
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
