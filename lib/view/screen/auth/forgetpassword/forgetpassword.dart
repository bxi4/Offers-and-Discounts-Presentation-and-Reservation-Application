import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/forgetpassword/forgetpassowrd_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/functions/vaildinput.dart';
import 'package:orop/view/widget/auth/custombuttonauth.dart';
import 'package:orop/view/widget/auth/customtextbodyauth.dart';
import 'package:orop/view/widget/auth/customtextformauth.dart';
import 'package:orop/view/widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    //Get.lazyPut(() => ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "Forget Password",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                          const CustomTextTitleAuth(text: "Check Email"),
                          const SizedBox(height: 10),
                          const CustomTextBodyAuth(
                              text:
                                  "please Enter Your Email Address To Recive A verification code"),
                          const SizedBox(height: 50),

                          const SizedBox(height: 10),
                          CustomTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 100, "email");
                            },
                            mycontroller: controller.email,
                            hinttext: "Enter Your Email",
                            labeltext: "Email",
                            iconData: Icons.email_outlined,
                            obscureText: false,
                          ),
                          const SizedBox(height: 10),
                          // Button
                          CustomButtonAuth(
                            text: 'Check',
                            onPressed: () {
                              controller.checkemail();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
