import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:orop/controller/forgetpassword/verfiycod_controller.dart';
import 'package:orop/core/class/handlihgdataview.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/core/functions/alertexitapp.dart';
import 'package:orop/view/widget/auth/customtextbodyauth.dart';
import 'package:orop/view/widget/auth/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "Verification Code",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<VerfiyCodeControllerImp>(
              builder: (controller) => HaindlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      //key: controller.formstate,
                      child: ListView(
                        children: [
                          //SizedBox(height: 20),
                          const CustomTextTitleAuth(text: "Check Code "),
                          const SizedBox(height: 10),
                          const CustomTextBodyAuth(
                              text:
                                  "Please Enter The Digit Code Sent To Magdy@gmail.com"),
                          const SizedBox(height: 15),

                          OtpTextField(
                            fieldWidth: 50.0,
                            borderRadius: BorderRadius.circular(20),
                            numberOfFields: 5,
                            borderColor: AppColor.primaryColor,
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.goToResetPassword(verificationCode);
                            }, // end onSubmit
                          ),

                          const SizedBox(height: 40),
                            InkWell(
                        onTap: () {
                          controller.reSend();
                        },
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: AppColor.thirdColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue.shade400),
                            ),
                            child: Text(
                              "Resend verfiy code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue[900], fontSize: 20),
                            ),
                          ),
                        ),
                      )
                        ],
                      ),
                    )),
              ),
            )));
  }
}
