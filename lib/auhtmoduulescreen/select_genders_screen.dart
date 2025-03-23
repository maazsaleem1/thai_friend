import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/what_gender_you_are_looking_for_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class SelectGenders extends StatefulWidget {
  const SelectGenders({super.key});

  @override
  State<SelectGenders> createState() => _SelectGendersState();
}

class _SelectGendersState extends State<SelectGenders> {
  RxBool selectgenderforman = false.obs;
  RxBool selectgenderforwoamn = false.obs;
  RxBool selectgenderfortransgender = false.obs;
  RxBool buttonbecomedark = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pinksahdebackground,
        body: SafeArea(
          child: SizedBox(
            width: 1.sw,
            child: Column(
              children: [
                10.verticalSpace,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      "assets/images/backicon.svg",
                      color: AppColors.white,
                    ),
                  ),
                ),
                25.verticalSpace,
                AppText(
                  text: "What Gender are You",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w900,
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
                    text: "I am a Man",
                    verticalMargin: 12,
                    textColor: selectgenderforman.value ? AppColors.orangebackgroundfortextandbutton : AppColors.white,
                    backgroundColor: selectgenderforman.value ? AppColors.white : AppColors.orangebackgroundfortextandbutton,
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
                    text: "I am a Woman",
                    textColor: selectgenderforwoamn.value ? AppColors.orangebackgroundfortextandbutton : AppColors.white,
                    verticalMargin: 12,
                    backgroundColor: selectgenderforwoamn.value ? AppColors.white : AppColors.orangebackgroundfortextandbutton,
                  );
                }),
                10.verticalSpace,
                Obx(() {
                  return AppButton(
                    onPress: () {
                      buttonbecomedark.value = true;
                      selectgenderforman.value = false;
                      selectgenderforwoamn.value = false;
                      selectgenderfortransgender.value = true;
                    },
                    textColor: selectgenderfortransgender.value ? AppColors.orangebackgroundfortextandbutton : AppColors.white,
                    text: "I am Transgenger",
                    verticalMargin: 12,
                    backgroundColor: selectgenderfortransgender.value ? AppColors.white : AppColors.orangebackgroundfortextandbutton,
                  );
                })
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h), // Adjust the space from the bottom
          child: BottomAppBar(
            color: AppColors.pinksahdebackground,
            child: Obx(() {
              return AppButton(
                onPress: () {
                  Get.to(() => const LookingGenderScreen());
                },
                horizontalMargin: 0,
                fontsize: 18,
                text: "Continue",
                textColor: buttonbecomedark.value ? AppColors.white : AppColors.orangebackgroundfortextandbutton,
                backgroundColor: buttonbecomedark.value ? AppColors.orangebackgroundfortextandbutton : AppColors.white,
              );
            }),
          ),
        ));
  }
}
