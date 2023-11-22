import 'package:flutter/material.dart';
import 'package:orop/core/constant/color.dart';

class HomeFirst extends StatelessWidget {
  const HomeFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
