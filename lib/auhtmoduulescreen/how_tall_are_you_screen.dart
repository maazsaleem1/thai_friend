import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/what_is%20_the_weight_screen.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class HowTallAreYouScreen extends StatefulWidget {
  const HowTallAreYouScreen({super.key});

  @override
  State<HowTallAreYouScreen> createState() => _HowTallAreYouScreenState();
}

class _HowTallAreYouScreenState extends State<HowTallAreYouScreen> {
  double _height = 168; // Initial height value

  // Convert centimeters to feet and inches
  String cmToFeetAndInches(double cm) {
    double inches = cm * 0.393701;
    int feet = (inches / 12).floor();
    int remainingInches = (inches % 12).round();
    return "$feet'$remainingInches\"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pinksahdebackground, // Dark background color
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const Text(
                "How Tall are You?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: AppColors.white,
                    activeTrackColor:
                        AppColors.orangebackgroundfortextandbutton,
                    thumbColor: AppColors.orangebackgroundfortextandbutton,
                    overlayColor: const Color(0x29eb1555),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                    ),
                    trackHeight: 5,
                  ),
                  child: SizedBox(
                    height: 400.h,
                    child: RotatedBox(
                      quarterTurns: -9,
                      child: Slider(
                        value: _height,
                        min: 10,
                        max: 270,
                        onChanged: (value) {
                          setState(() {
                            _height = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              40.verticalSpace,
              Text(
                "${_height.round()}cm / ${cmToFeetAndInches(_height)}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Continue Button
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(bottom: 20.h), // Adjust the space from the bottom
          child: BottomAppBar(
            clipBehavior: Clip.none,
            color: AppColors.pinksahdebackground,
            child: AppButton(
              onPress: () {
                Get.to(() => const WhatIsYourWeightScreen());
              },
              horizontalMargin: 20,
              text: "Continue",
              fontsize: 18,
              textColor: AppColors.white,
              backgroundColor: AppColors.orangebackgroundfortextandbutton,
            ),
          ),
        ));
  }
}
