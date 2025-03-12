import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/select_date_of_birth_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class LookingGenderScreen extends StatefulWidget {
  const LookingGenderScreen({super.key});

  @override
  State<LookingGenderScreen> createState() => _LookingGenderScreenState();
}

class _LookingGenderScreenState extends State<LookingGenderScreen> {
  RxBool selectgenderforman = false.obs;
  RxBool selectgenderforwoamn = false.obs;
  RxBool selectgenderfortransgender = false.obs;
  RxBool buttonbecomedark = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pinksahdebackground,
        body: SizedBox(
          width: 1.sw,
          child: Column(
            children: [
              70.verticalSpace,
              AppText(
                text: "Looking for..",
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
              15.verticalSpace,
              AppText(
                text: "Who would you like to meet",
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
              15.verticalSpace,
              Obx(() {
                return AppButton(
                  onPress: () {
                    selectgenderforman.value = true;
                    selectgenderforwoamn.value = false;
                    selectgenderfortransgender.value = false;
                    buttonbecomedark.value = true;
                  },
                  text: "I am looking a Man",
                  verticalMargin: 12,
                  backgroundColor: selectgenderforman.value
                      ? AppColors.tealbackground
                      : AppColors.tealbackground.withOpacity(0.3),
                );
              }),
              10.verticalSpace,
              Obx(() {
                return AppButton(
                  onPress: () {
                    buttonbecomedark.value = true;
                    selectgenderforman.value = false;
                    selectgenderforwoamn.value = true;
                    selectgenderfortransgender.value = false;
                  },
                  text: "I am looking a Woman",
                  verticalMargin: 12,
                  backgroundColor: selectgenderforwoamn.value
                      ? AppColors.tealbackground
                      : AppColors.tealbackground.withOpacity(0.3),
                );
              }),
              10.verticalSpace,
              Obx(() {
                return AppButton(
                  onPress: () {
                    selectgenderforman.value = false;
                    selectgenderforwoamn.value = false;
                    buttonbecomedark.value = true;
                    selectgenderfortransgender.value = true;
                  },
                  text: "I am looking for Transgenger",
                  verticalMargin: 12,
                  backgroundColor: selectgenderfortransgender.value
                      ? AppColors.tealbackground
                      : AppColors.tealbackground.withOpacity(0.3),
                );
              })
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(bottom: 20.h), // Adjust the space from the bottom
          child: BottomAppBar(
            clipBehavior: Clip.none,
            color: AppColors.pinksahdebackground,
            child: Obx(() {
              return AppButton(
                onPress: () {
                  Get.to(() => DateOfBirthPicker());
                },
                horizontalMargin: 0,
                text: "Continue",
                backgroundColor: buttonbecomedark.value
                    ? AppColors.buttoncolourforapp
                    : AppColors.buttoncolourforapp.withOpacity(0.5),
              );
            }),
          ),
        ));
  }
}
