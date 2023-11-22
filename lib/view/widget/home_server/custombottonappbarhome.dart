import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/homescreen_controller.dart';
import 'package:orop/view/widget/home_server/custombuttonappbar.dart';

class CustomBottonAppBarHome extends StatelessWidget {
  const CustomBottonAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: ((controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomButtonAppBar(
                            //  textbutton: controller.bottonappbar[i]['title'],
                            icondata: controller.bottonappbar[i]['icon'],
                            onPressed: () {
                              controller.changPage(i);
                            },
                            active: controller.currentpage == i ? true : false);
                  }))
                ],
              ),
            )));
  }
}

// GetBuilder<HomeScreenControllerImp>(
//         builder: ((controller) => BottomAppBar(
//               shape: const CircularNotchedRectangle(),
//               notchMargin: 10,
//               child: Row(
//                 children: [
//                   ...List.generate(
//                     controller.listPage.length,
//                     ((index) => CustomButtonAppBar(
//                         textbutton: controller.titlebottonappbar[index],
//                         icondata: controller.bottonicon[index],
//                         onPressed: () {
//                           controller.changPage(index);
//                         },
//                         active:
//                             controller.currentpage == index ? true : false)),
//                   )
//                 ],
//               ),
//             )));