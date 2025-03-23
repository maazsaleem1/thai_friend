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
                      fontsize: 30.sp,
                      fontweight: FontWeight.w800,
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
                    textColor: AppColors.white,
                    verticalMargin: 13.h,
                    onPress: () {
                      // Get.to(() => const RegisterInTheApp());
                    },
                    textalignment: TextAlign.start,
                    text: "Continue with Google",
                    backgroundColor: AppColors.orangebackgroundfortextandbutton,

                    // backgroundColor: Appcolors.containerbackground,
                  ),
                  10.verticalSpace,
                  AppButton(
                    verticalMargin: 13.h,
                    onPress: () {
                      Get.to(
                        () => const RegisterEmail(),
                      );
                    },
                    textalignment: TextAlign.start,
                    text: "Continue with Email",
                    backgroundColor: AppColors.white,
                    textColor: AppColors.orangebackgroundfortextandbutton,
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
