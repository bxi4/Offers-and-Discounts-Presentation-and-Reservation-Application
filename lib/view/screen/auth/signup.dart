import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/auth/signup_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/core/functions/vaildinput.dart';
import 'package:orop/view/widget/auth/custombuttonauth.dart';
import 'package:orop/view/widget/auth/customtextbodyauth.dart';
import 'package:orop/view/widget/auth/customtextformauth.dart';
import 'package:orop/view/widget/auth/customtexttitleauth.dart';
import 'package:orop/view/widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    // Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            'Sign Up',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(
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
                            const CustomTextTitleAuth(text: "Welcome Back"),
                            const SizedBox(height: 10),
                            const CustomTextBodyAuth(
                                text:
                                    "Sign Up With Your Email And Password OR Continue With Social Media"),
                            const SizedBox(height: 50),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "Username");
                              },
                              mycontroller: controller.username,
                              hinttext: "Enter Your Username",
                              labeltext: "Username",
                              iconData: Icons.person_outline,
                              obscureText: false,
                            ),
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
                            CustomTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 5, 100, "Phone");
                              },
                              mycontroller: controller.phone,
                              hinttext: "Enter Your Phone",
                              labeltext: "Phone",
                              iconData: Icons.phone_android_outlined,
                              // obscureText: false,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormAuth(
                              obscureText: controller.isshowpassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "Enter Your Password",
                              labeltext: "Password",
                              iconData: Icons.lock_outline,
                            ),

                            // Button
                            CustomButtonAuth(
                              text: 'Sign Up',
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                            const SizedBox(height: 40),
                            CustomTestSignUpOrSignIn(
                              textone: "have an account ? ",
                              texttwo: " Sign In",
                              onTap: () {
                                controller.goToSignIn();
                              },
                            ),
                          ],
                        ),
                      ),
                    ))
                // ? const Center(
                //     child: Text("Loading..."),
                //   )
                // :
                )));
  }
}
