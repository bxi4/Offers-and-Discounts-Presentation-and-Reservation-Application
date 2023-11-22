import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/core/constant/color.dart';

// class CustomEditComment extends GetView<CommentsController> {
//   const CustomEditComment({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ProductDetailsControllerImp controllerImp =
//         Get.put(ProductDetailsControllerImp());
//     return EditComment(commentsModel: controller.data[controller.cid!]);
//     //     ListView.separated(
//     //   separatorBuilder: ((context, index) => const SizedBox(width: 10)),
//     //   itemCount: controller.data.length,
//     //   itemBuilder: (context, index) {
//     //     return EditComment(commentsModel: controller.data[index]);
//     //   },
//     // );
//   }
// }

class EditComment extends GetView<CommentsController> {
  // final CommentsModel commentsModel;

  const EditComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final textController = Get.put(TextController());
    Get.put(CommentsController());
    //bool i;
    //controller.cid = commentsModel.comId!;

    return GetBuilder<CommentsController>(builder: (controller) {
      return Column(
        children: [
          TextFormField(
            controller: controller.name1,
            decoration: InputDecoration(
              hintText: "تعديل",
              hintStyle: const TextStyle(
                color: AppColor.grey,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 35),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(style: BorderStyle.none)),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.send,
                  //color: Colors.blue,
                ),
                onPressed: () async {
                  controller.commentsModel.comId!;
                  String comid = Get.arguments['id'];
                  String productId = Get.arguments['pid'];
                  // String comment = Get.arguments['name'];
                  await controller.editComments(comid, productId);
                  print(comid);
                  print(productId);
                  //  print(controller.cid!);
                  // controller.updateComment(controller.commentsModel.comId!,
                  //     controller.commentsModel.comment!);
                  //Get.back();
                  controller.name1.clear();
                },
              ),
            ),
          ),
          const Divider(color: AppColor.grey2),
        ],
      );
    });
  }
}

// TextFormFieldText(
            //     hinTextForm: "تعديل",
            //     onPressed: () {
            // controller.editComments(controller.commentsModel.comId!);
            // controller.name.clear();
            //     })