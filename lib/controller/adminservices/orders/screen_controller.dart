import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/view/admin_services/orders/accepted.dart';
import 'package:orop/view/admin_services/orders/archive.dart';
import 'package:orop/view/admin_services/orders/pending.dart';

abstract class AdminServicesOrdarScreenController extends GetxController {
  changPage(int currentpage);
}

class AdminServicesOrdarScreenControllerImp
    extends AdminServicesOrdarScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const AdminServicesOrdersPending(),
    const AdminServicesOrdersAccepted(),
    const AdminServicesOrdersArchiveView(),
    //const Text(''),
  ];

  List bottonappbar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Archive", "icon": Icons.archive_outlined},
    //{"title": "Settings", "icon": Icons.settings},
  ];

  @override
  changPage(int i) {
    currentpage = i;
    update();
  }
}
