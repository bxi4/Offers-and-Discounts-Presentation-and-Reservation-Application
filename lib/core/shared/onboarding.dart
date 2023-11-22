import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:orop/core/constant/color.dart';
import 'package:orop/view/widget/onboarding/custombutten.dart';
import 'package:orop/view/widget/onboarding/customslider.dart';
import 'package:orop/view/widget/onboarding/dotconttroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBording(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerBording(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtenOnBoarding()
                  ],
                ),
                
                )
          ],
        )));
  }
}
