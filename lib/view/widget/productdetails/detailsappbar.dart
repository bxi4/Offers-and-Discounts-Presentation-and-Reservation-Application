import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/routes.dart';

class DetailsAppBar extends StatelessWidget {
  final String text;
  const DetailsAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
            child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offNamed(AppRoute.product);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: Colors.redAccent),
          )
        ]);
  }
}
