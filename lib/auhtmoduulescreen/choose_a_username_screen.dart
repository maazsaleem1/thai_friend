// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/upload_a_photos.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class ChooseAUsername extends StatelessWidget {
  const ChooseAUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinksahdebackground,
      body: SizedBox(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            45.verticalSpace,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  "assets/images/backicon.svg",
                  color: AppColors.black,
                ),
              ),
            ),
            25.verticalSpace,
            AppText(
              text: "Choose a Username",
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
            15.verticalSpace,
            const AppInput(
              label: "Username",
              placeHolder: "Enter Username",
              verticalPadding: 0,
              horizontalMargin: 20,
              backColor: AppColors.tealbackground,
              bottomMargin: 0,
              borderColor: Colors.transparent,
            ),
            10.verticalSpace,
            AppText(
              textalignment: TextAlign.center,
              text: "Usernames are visible to others memeber and can contains letter and numbers only",
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: 20.h,
        ), // Adjust the space from the bottom
        child: BottomAppBar(
          clipBehavior: Clip.none,
          color: AppColors.pinksahdebackground,
          child: AppButton(
            onPress: () {
              Get.to(() => const UploadAPhotoScreen());
            },
            horizontalMargin: 0,
            text: "Continue",
            backgroundColor: AppColors.buttoncolourforapp,
          ),
        ),
      ),
    );
  }
}
