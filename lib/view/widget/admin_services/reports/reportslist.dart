import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/adminservices/products/report_controller.dart';
import 'package:orop/data/model/productsmodel.dart';
import 'package:orop/linkapi.dart';

class ListProductsReport extends GetView<RepoetsController> {
  final List<ProductsModel> listdatamodel;
  const ListProductsReport({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // controller.gotoPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 1),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestProduct}/${listdatamodel[index].productsImage}")),
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "     CO: ${listdatamodel[index].servicesName!}",
                                style: TextStyle(
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                              ListTile(
                                title: Text(listdatamodel[index].productsName!),
                                subtitle:
                                    Text(listdatamodel[index].categoriesName!),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 105, top: 75),
                            child: Text(listdatamodel[index].productsDate!,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
