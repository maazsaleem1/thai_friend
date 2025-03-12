import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Text(
                  'We will send a code to the email below',
                  style: interFont(
                    fontsize: 15,
                    fontweight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                30.verticalSpace,
                AppButton(
                  horizontalMargin: 70.w,
                  text: "EMAIL CODE",
                  backgroundColor: const Color(0xFF00796B),
                  fontweight: FontWeight.w500,
                  onPress: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
