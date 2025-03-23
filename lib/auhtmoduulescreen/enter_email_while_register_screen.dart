import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/get_a_code_while_register_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/fonts.dart';

import '../res/appcolors.dart';

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.pinksahdebackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.verticalSpace,
              Text(
                'We will send a code to the email below',
                style: interFont(
                  fontsize: 20.sp,
                  fontweight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              30.verticalSpace,
              const AppInput(
                // isAutoFocus: true,
                isCounterText: true,
                placeHolder: "your@email.address",
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
                text: "EMAIL CODE",
                backgroundColor: AppColors.orangebackgroundfortextandbutton,
                textColor: AppColors.white,
                onPress: () {
                  Get.to(() => const OtpAfterSignup());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
