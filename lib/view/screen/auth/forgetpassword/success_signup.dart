import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/auth/successsignup_controller.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "Success",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: AppColor.primaryColor,
                ),
              ),
              const Text("successfully registered"),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  text: "Go To Login",
                  onPressed: () {
                    controller.goToPageLogin();
                  },
                ),
              ),
              //const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
