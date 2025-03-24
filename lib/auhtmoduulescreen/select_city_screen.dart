import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/profile_headline_and_description.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class LocationScreenSelect extends StatelessWidget {
  const LocationScreenSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: false,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: AppText(
                    textalignment: TextAlign.center,
                    text: "My Current City",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
                20.verticalSpace,
                const AppInput(
                  postfixIcon: Icon(Icons.my_location_sharp),
                  placeHolder: "current city",
                  backColor: AppColors.white,
                ),
                40.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: AppText(
                    textalignment: TextAlign.center,
                    text: "Where I'm From",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
                20.verticalSpace,
                const AppInput(
                  postfixIcon: Icon(Icons.arrow_forward_ios_outlined),
                  placeHolder: "country",
                  backColor: AppColors.white,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h), // Adjust the space from the bottom
          child: BottomAppBar(
            clipBehavior: Clip.none,
            color: AppColors.pinksahdebackground,
            child: AppButton(
              onPress: () {
                Get.to(() => const AddProfileAndDescription());
              },
              text: "Continue",
              backgroundColor: AppColors.orangebackgroundfortextandbutton,
              textColor: AppColors.white,
            ),
          ),
        ));
  }
}
