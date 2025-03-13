import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/select_city_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinksahdebackground,
      body: SafeArea(
        child: Column(
          children: [
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AppText(
                textalignment: TextAlign.center,
                text: "We Want everyone using Flrvi to be safe and enjoy using this app",
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            80.verticalSpace,
            Container(
              height: 300.h,
              width: 1.sw,
              color: const Color(0xFF00796B).withOpacity(0.5),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.amber,
                          size: 40,
                        ),
                        10.horizontalSpace,
                        AppText(
                          text: "Do not harass ohers memebers by\n sending unwanted messages or photos",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.amber,
                          size: 40,
                        ),
                        10.horizontalSpace,
                        AppText(
                          text: "Keep your profile clean of obscene\n photos or text",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Row(
                      children: [
                        const Icon(
                          Icons.local_florist_sharp,
                          color: Colors.green,
                          size: 40.0,
                        ),
                        10.horizontalSpace,
                        AppText(
                          text: "Be nice to other members",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            140.verticalSpace,
            AppButton(
              text: "I Agree",
              onPress: () {
                Get.to(() => const LocationScreenSelect());
              },
              backgroundColor: AppColors.buttoncolourforapp,
              textColor: AppColors.white,
              horizontalMargin: 40.w,
              verticalMargin: 25.h,
              // verticalMargin: 13.h,
              fontweight: FontWeight.w700,
            ),
            15.verticalSpace,
            AppText(
              text: "By using this app you agree to our",
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.white,
            ),
            AppText(
              text: "Terms and Conditions & Privacy Policy",
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
