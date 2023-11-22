import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orop/controller/auth/loginbrowser_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/functions/vaildinput.dart';
import 'package:orop/view/widget/auth/custombuttonauth.dart';
import 'package:orop/view/widget/auth/customtextbodyauth.dart';
import 'package:orop/view/widget/auth/customtextformauth.dart';
import 'package:orop/view/widget/auth/customtexttitleauth.dart';
import 'package:orop/view/widget/auth/textsignup.dart';

class LoginBrowser extends StatelessWidget {
  const LoginBrowser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginBrowserControllerImp());
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: AppColor.backgroundcolor,
        //   elevation: 0.0,
        //   title: Text(
        //     "Sign In",
        //     style: Theme.of(context)
        //         .textTheme
        //         .headline1!
        //         .copyWith(color: AppColor.grey),
        //   ),
        // ),
        body: GetBuilder<LoginBrowserControllerImp>(
            init: LoginBrowserControllerImp(),
            builder: (controller) => HaindlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    child: ListView(
                      children: [
                        const SizedBox(height: 50),
                        const CustomTextTitleAuth(text: "Login!"),
                        const SizedBox(height: 10),
                        const CustomTextBodyAuth(
                            text:
                                "In order to continue you are required to login"),
                        const SizedBox(height: 100),
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
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: const Text("Forget Password",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.end),
                        ),
                        // Button
                        CustomButtonAuth(
                          text: 'Sign In',
                          onPressed: () {
                            controller.loginV2();
                          },
                        ),
                        const SizedBox(height: 40),
                        CustomTestSignUpOrSignIn(
                          textone: "Dont Have An Account? ",
                          texttwo: "Sign Up",
                          onTap: () {
                            controller.goToSignUp();
                          },
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
