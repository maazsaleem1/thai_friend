import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title Text
              const Text(
                "How Tall are You?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              40.verticalSpace,

              // Vertical Slider
              Container(
                width: 1.sw,
                height: 400,
                color: AppColors.tealbackground.withOpacity(0.5),
                child: RotatedBox(
                  quarterTurns: -1, // Rotates the slider vertically
                  child: Slider(
                    value: _height,
                    min: 100,
                    max: 220,
                    activeColor: AppColors.tealbackground,
                    inactiveColor: AppColors.white,
                    onChanged: (value) {
                      setState(() {
                        _height = value; // Updates height dynamically
                      });
                    },
                  ),
                ),
              ),

              40.verticalSpace,
              // Dynamic Height Display (in cm and feet/inches)
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
              horizontalMargin: 30,
              text: "Continue",
              backgroundColor: AppColors.buttoncolourforapp,
            ),
          ),
        ));
  }
}
