import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/comments_controller.dart';
import 'package:orop/controller/home_server_controller.dart';
import 'package:orop/controller/productdetails_controller.dart';
import 'package:orop/data/model/commentsmodel.dart';

class CustomListComments extends GetView<CommentsController> {
  const CustomListComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      height: Get.height / 1.1,
      child: ListView.separated(
        separatorBuilder: ((context, index) => const SizedBox(width: 10)),
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          final com = controller.data[index];
          return comment(
            isMe: controller.myServices.sharedPreferences.getString("id")! ==
                controller.data[index].commentUsers!,
            key: ValueKey(com.comId!),
            // i: index,
            keyv: ValueKey(index.toString()),
            commentsModel: controller.data[index],
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
class comment extends StatelessWidget {
  final CommentsModel commentsModel;
  final Key keyv;
  final bool isMe;
  const comment({
    Key? key,
    required this.commentsModel,
    required this.keyv,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp cpd = Get.put(ProductDetailsControllerImp());
    HomeServerControllerImp controllerImp = Get.put(HomeServerControllerImp());
    CommentsController controller = Get.put(CommentsController());
    // UpdateViewEditController controller1 = Get.put(UpdateViewEditController());
    //controller.cid = commentsModel.commentUsers!;
    controller.commentsModel = commentsModel;
    // ignore: prefer_conditional_assignment
    // if (controller.cid == null) {
    //   controller.cid = i;
    // }
    //controller.isSignIn == isMe;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height - 70,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 125,
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  margin: const EdgeInsets.only(top: 15),
                  child: Text(commentsModel.commentSername!,
                      // textDirection:
                      //     isMe ? TextDirection.rtl : TextDirection.ltr,
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              subtitle: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Slidable(
                  //   key: keyv,
                  //   enabled: true,
                  //   actionPane: const SlidableScrollActionPane(),
                  //   actionExtentRatio: 0.1,
                  //   showAllActionsThreshold: 0.5,
                  //   secondaryActions: [
                  // Container(
                  //   height: 56,
                  //   decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //       topRight: Radius.circular(5),
                  //       bottomLeft: Radius.circular(5),
                  //     ),
                  //     color: Color.fromARGB(255, 236, 228, 228),
                  //   ),
                  //   child: IconButton(
                  //     onPressed: () {
                  //       controller.deletecomment(commentsModel.comId!);
                  //     },
                  //     icon: const Icon(
                  //       Icons.delete_forever_outlined,
                  //       color: Colors.red,
                  //       size: 25,
                  //     ),
                  //   ),
                  // ),
                  // ],
                  // child:
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        width: 322,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: isMe ? Colors.grey[100] : Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Text(commentsModel.comment!,
                            // textDirection:
                            //     isMe ? TextDirection.rtl : TextDirection.ltr,
                            style: const TextStyle(fontSize: 15)),
                      ),
                      Container(
                          //height: 10,
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await controller.gotoPageCommentEdit(
                                      commentsModel.comId!,
                                      commentsModel.comment!,
                                      commentsModel.commentProductid!,
                                    );
                                    print(commentsModel.comId!);
                                    print(commentsModel.comment!);
                                    //print(i!);
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    controller
                                        .deletecomment(commentsModel.comId!);
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.red,
                                  )),
                            ],
                          )),
                    ],
                  ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
