import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class LocationScreenSelect extends StatelessWidget {
  const LocationScreenSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pinksahdebackground,
        body: SizedBox(
          width: 1.sw,
          child: Column(
            children: [
              50.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: AppText(
                  textalignment: TextAlign.center,
                  text: "My Current City",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              20.verticalSpace,
              const AppInput(
                verticalPadding: 30,
                postfixIcon: Icon(Icons.my_location_sharp),
                placeHolder: "current city",
                backColor: AppColors.tealbackground,
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: AppText(
                  textalignment: TextAlign.center,
                  text: "Where I'm From",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              20.verticalSpace,
              const AppInput(
                verticalPadding: 30,
                postfixIcon: Icon(Icons.arrow_forward_ios_outlined),
                placeHolder: "country",
                backColor: AppColors.tealbackground,
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h), // Adjust the space from the bottom
          child: BottomAppBar(
            clipBehavior: Clip.none,
            color: AppColors.pinksahdebackground,
            child: AppButton(
              onPress: () {
                // Get.to(() => const WhatIsYourWeightScreen());
              },
              horizontalMargin: 30,
              text: "Continue",
              backgroundColor: AppColors.buttoncolourforapp,
            ),
          ),
        ));
  }
}
