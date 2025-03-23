import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/choose_a_username_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';

import '../res/appcolors.dart';

class OtpAfterSignup extends StatelessWidget {
  const OtpAfterSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.pinksahdebackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppText(
              text: "check your email for login code and enter it below",
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.white,
              textalignment: TextAlign.center,
            ),
          ),
          30.verticalSpace,
          const AppInput(
            // isAutoFocus: true,
            isCounterText: true,
            placeHolder: "xxxxxxxx",
            verticalPadding: 0,
            horizontalMargin: 20,
            backColor: AppColors.white,
            bottomMargin: 0,
            borderColor: Colors.transparent,
          ),
          30.verticalSpace,
          AppButton(
            verticalMargin: 10,
            horizontalMargin: 50.w,
            text: "CONFIRM",
            backgroundColor: AppColors.orangebackgroundfortextandbutton,
            textColor: AppColors.white,
            onPress: () {
              Get.to(() => const ChooseAUsername());
            },
          ),
        ],
      ),
    );
  }
}
