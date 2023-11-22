import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/linkapi.dart';
import 'package:orop/view/widget/categories/customtitlehome.dart';
import 'package:orop/view/widget/home_server/customimageads.dart';

class GridViewServerBody1 extends GetView<HomeServerControllerImp> {
  const GridViewServerBody1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // ListView.separated(
        //     separatorBuilder: (context, index) => const SizedBox(height: 1),
        //     itemCount: controller.services.length,
        //     itemBuilder: (context, index) {
        //       return ServicesBody(
        //           text: controller.services[index]['services_name'],
        //           imagename: controller.services[index]['services_image']);
        //     });

        CustomScrollView(
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            //clipBehavior: Clip.hardEdge,
            //anchor: 0.1,
            //physics: ScrollPhysics(),
            shrinkWrap: true,
            dragStartBehavior: DragStartBehavior.down,
            reverse: false,
            slivers: [
          SliverAppBar(
            forceElevated: true,
            // floating: true,
            pinned: true,
            backgroundColor: Colors.white.withOpacity(1),
            expandedHeight: 260,
            toolbarHeight: 1,
            //leadingWidth: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                child: const CustomImageAds(),
              ),
            ),
          ),
          SliverAnimatedList(
            itemBuilder: (context, index, animation) {
              return const CustomTitleHome(title: "  Servises");
            },
            initialItemCount: 1,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                return ServicesBody(
                  i: index,
                  text: controller.services[index]['services_name'],
                  imagename: controller.services[index]['services_image'],
                  onTapOn: () {
                    controller.gotoCategories(controller.services, index,
                        controller.services[index]['services_id']);
                  },
                );
              },
              childCount: controller.services.length,
            ),
          )
        ]);
  }
}

class ServicesBody extends GetView<HomeServerControllerImp> {
  //final ServicesModel servicesModel;
  final Function()? onTapOn;
  final String text;
  final String imagename;
  final int? i;
  const ServicesBody(
      {Key? key,
      required this.i,
      required this.onTapOn,
      required this.text,
      required this.imagename})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapOn,
      child: Card(
        child: Container(
          // color: Colors.white,

          // height: 120,
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 60),
                    height: 32,
                    width: 80,
                    decoration: const BoxDecoration(
                        color: AppColor.thirdColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(17),
                          bottomLeft: Radius.circular(17),
                        )),
                    child: Center(
                      child: Text(
                        "مفتوح",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text("$text \n",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16)),
                        subtitle: const Text("Details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.primaryColor, fontSize: 18)),
                      )),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "${AppLink.imagestServices}/$imagename",
                        //fit: BoxFit.cover,
                        height: 90,
                        // width: 150,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
