import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/choose_a_username_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/fonts.dart';

import '../res/appcolors.dart';

class OtpAfterSignup extends StatelessWidget {
  const OtpAfterSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinksahdebackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 180.h,
            width: 1.sw,
            color: const Color(0xFF00796B).withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  10.verticalSpace,
                  Text(
                    'check your email for login code and enter it below',
                    style: interFont(
                      fontsize: 15,
                      fontweight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  5.verticalSpace,
                  const AppInput(
                    placeHolder: "XXXXXXX",
                    verticalPadding: 0,
                    horizontalMargin: 50,
                    backColor: Color(0xFF00796B),
                    bottomMargin: 0,
                    borderColor: Colors.transparent,
                  ),
                  15.verticalSpace,
                  AppButton(
                    verticalMargin: 10,
                    horizontalMargin: 30.w,
                    text: "CONFIRM",
                    backgroundColor: AppColors.buttoncolourforapp,
                    fontweight: FontWeight.w500,
                    onPress: () {
                      Get.to(() => const ChooseAUsername());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
