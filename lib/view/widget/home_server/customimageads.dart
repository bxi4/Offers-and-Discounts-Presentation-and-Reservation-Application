import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/linkapi.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomImageAds extends StatelessWidget {
  const CustomImageAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    Get.put(HomeServerControllerImp());
    return GetBuilder<HomeServerControllerImp>(
        builder: (controller) => Container(
              // height: 200,

              child: CarouselSlider.builder(
                itemCount: controller.specialoffers.length,
                carouselController: carouselController,
                options: CarouselOptions(
                    height: 256,
                    autoPlay: true,
                    //enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    //pauseAutoPlayInFiniteScroll: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    viewportFraction: 1,
                    onPageChanged: (index, reson) {}),
                itemBuilder: (context, index, realIndex) {
                  return Card(
                      borderOnForeground: true,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      //elevation: 20,
                      color: Colors.black,
                      // margin: const EdgeInsets.all(25),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imageSpecialOffers}/${controller.specialoffers[index]['special_offers_image']}",
                            fit: BoxFit.fill,
                            height: 256,
                            width: 400,
                            placeholder: (context, url) {
                              Future.delayed(Duration(seconds: 3)).then((_) {
                                controller
                                    .update(); // تحديث واجهة المستخدم بعد انتهاء التأخير
                              });

                              return CircularPercentIndicator(
                                animation: true,
                                radius: 100,
                                lineWidth: 12,
                                percent: 1,
                                progressColor: Colors.deepPurple,
                                backgroundColor: Colors.deepPurple.shade100,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text(
                                  '100 %',
                                  style: TextStyle(fontSize: 25),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Container(
                            height: 50,
                            //  width: 50,
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.5),
                                //border: Border.all(color: Colors.white),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  topLeft: Radius.circular(13),
                                )),
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return FractionallySizedBox(
                                        widthFactor: 1.14,
                                        heightFactor: 0.9,
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(10.0),
                                          content: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    "${AppLink.imageSpecialOffers}/${controller.specialoffers[index]['special_offers_image']}",
                                                fit: BoxFit.fill,
                                                height: 256,
                                                width: 400,
                                                placeholder: (context, url) =>
                                                    CircularPercentIndicator(
                                                  radius: 100,
                                                  lineWidth: 15,
                                                  percent: 1,
                                                  progressColor: Colors.white,
                                                  backgroundColor:
                                                      Colors.white38,
                                                  circularStrokeCap:
                                                      CircularStrokeCap.round,
                                                  center: Text('100 %',
                                                      style: TextStyle(
                                                          fontSize: 25)),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(Icons.cancel_sharp,
                                                      size: 35,
                                                      color: Colors.grey[100]))
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: Stack(
                                children: [
                                  Icon(
                                    FlutterIcons.search_faw,
                                    color: Colors.white,
                                  ),
                                  Positioned(
                                    top: 6.2,
                                    right: 9,
                                    child: Icon(
                                      FontAwesome.plus,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ]));
                },
              ),
            ));
  }
}
