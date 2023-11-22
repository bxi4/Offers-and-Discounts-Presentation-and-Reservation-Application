import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/forgetpassword/resetpassword_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/core/functions/vaildinput.dart';
import 'package:orop/view/widget/auth/custombuttonauth.dart';
import 'package:orop/view/widget/auth/customtextbodyauth.dart';
import 'package:orop/view/widget/auth/customtextformauth.dart';
import 'package:orop/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "Reset Password",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) => HaindlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const SizedBox(height: 50),
                              const CustomTextTitleAuth(text: "New Password"),
                              const SizedBox(height: 10),
                              const CustomTextBodyAuth(
                                  text: "Please Enter new Password"),
                              const SizedBox(height: 50),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "password");
                                },
                                mycontroller: controller.password,
                                hinttext: "Enter Your Password",
                                labeltext: "Password",
                                iconData: Icons.lock_outlined,
                                obscureText: false,
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "repassword");
                                },
                                mycontroller: controller.repassword,
                                hinttext: "Re" + "" + "Enter Your Password",
                                labeltext: "Password",
                                iconData: Icons.lock_outlined,
                                obscureText: false,
                              ),
                              const SizedBox(height: 10),
                              // Button
                              CustomButtonAuth(
                                text: 'save',
                                onPressed: () {
                                  controller.goToSuccessResetPassword();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
