import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
      body: Stack(
        children: [
          SafeArea(
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
                    text: "Looking for..",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
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
                      text: "I am looking a Woman",
                      verticalMargin: 12,
                      textColor: selectgenderforwoamn.value ? AppColors.orangebackgroundfortextandbutton : AppColors.white,
                      backgroundColor: selectgenderforwoamn.value ? AppColors.white : AppColors.orangebackgroundfortextandbutton,
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
                      text: "I am looking for Transgender",
                      textColor: selectgenderfortransgender.value ? AppColors.orangebackgroundfortextandbutton : AppColors.white,
                      verticalMargin: 12,
                      backgroundColor: selectgenderfortransgender.value ? AppColors.white : AppColors.orangebackgroundfortextandbutton,
                    );
                  })
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Obx(() {
              return AppButton(
                onPress: () {
                  Get.to(() => DateOfBirthPicker());
                },
                horizontalMargin: 20,
                fontsize: 18,
                text: "Continue",
                textColor: buttonbecomedark.value ? AppColors.white : AppColors.orangebackgroundfortextandbutton,
                backgroundColor: buttonbecomedark.value ? AppColors.orangebackgroundfortextandbutton : AppColors.white,
              );
            }),
          )
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(
      //     bottom: 20.h,
      //   ), // Adjust the space from the bottom
      //   child: BottomAppBar(
      //     clipBehavior: Clip.none,
      //     color: AppColors.pinksahdebackground,
      //     child:
      //   ),
      // )
    );
  }
}
