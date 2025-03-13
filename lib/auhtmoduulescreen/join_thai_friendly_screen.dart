import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/enter_email_while_register_screen.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:thai_friendly_app/res/fonts.dart';

class RegisterInTheApp extends StatelessWidget {
  const RegisterInTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinksahdebackground,
      body: SizedBox(
        width: 1.sw,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/wavingicon.svg",
                  height: 50.h,
                ),
                25.verticalSpace,
                Center(
                  child: Text(
                    "  Welcome to \n ThaiFriendly!",
                    style: interFont(
                      fontsize: 25.sp,
                      fontweight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  AppButton(
                    textColor: AppColors.black,
                    verticalMargin: 13.h,
                    fontweight: FontWeight.w700,
                    onPress: () {
                      // Get.to(() => const RegisterInTheApp());
                    },
                    textalignment: TextAlign.start,
                    text: "Continue with Google",
                    // backgroundColor: const Color(0xfff6a3a3),
                    backgroundColor: AppColors.white,
                    // backgroundColor: Appcolors.containerbackground,
                  ),
                  10.verticalSpace,
                  AppButton(
                    verticalMargin: 13.h,
                    fontweight: FontWeight.w700,
                    onPress: () {
                      Get.to(() => const RegisterEmail());
                    },
                    textalignment: TextAlign.start,
                    text: "Continue with Email",
                    backgroundColor: const Color(0xFF2B3A67),
                    // backgroundColor: AppColors.blue,
                    // backgroundColor: Appcolors.containerbackground,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
