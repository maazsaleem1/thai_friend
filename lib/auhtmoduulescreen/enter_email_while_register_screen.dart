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
      backgroundColor: AppColors.pinksahdebackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150.h,
            width: 1.sw,
            color: const Color(0xFF00796B).withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.verticalSpace,
                Text(
                  'We will send a code to the email below',
                  style: interFont(
                    fontsize: 15,
                    fontweight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                10.verticalSpace,
                const AppInput(
                  placeHolder: "your@email.address",
                  verticalPadding: 0,
                  horizontalMargin: 50,
                  backColor: Color(0xFF00796B),
                  bottomMargin: 0,
                  borderColor: Colors.transparent,
                ),
                5.verticalSpace,
                AppButton(
                  verticalMargin: 10,
                  horizontalMargin: 70.w,
                  text: "EMAIL CODE",
                  backgroundColor: AppColors.buttoncolourforapp,
                  fontweight: FontWeight.w500,
                  onPress: () {
                    Get.to(() => const OtpAfterSignup());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
