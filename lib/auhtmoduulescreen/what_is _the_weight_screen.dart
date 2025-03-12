import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class WhatIsYourWeightScreen extends StatefulWidget {
  const WhatIsYourWeightScreen({super.key});

  @override
  State<WhatIsYourWeightScreen> createState() => _WhatIsYourWeightScreenState();
}

class _WhatIsYourWeightScreenState extends State<WhatIsYourWeightScreen> {
  double _weightKg = 70; // Default weight in kg

  // Convert kg to lbs
  double get weightLbs => _weightKg * 2.20462;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pinksahdebackground, // Background color
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Title
              const Text(
                'What is Your Weight?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // Vertical Slider
              Expanded(
                child: Center(
                  child: Container(
                    width: 1.sw,
                    color: AppColors.tealbackground
                        .withOpacity(0.5), // Slider background
                    child: RotatedBox(
                      quarterTurns: -1, // Rotates the slider vertically
                      child: Slider(
                        value: _weightKg,
                        min: 30, // Minimum weight (kg)
                        max: 150, // Maximum weight (kg)
                        activeColor:
                            AppColors.tealbackground, // Active track color
                        inactiveColor: AppColors.white, // Inactive track color
                        onChanged: (value) {
                          setState(() {
                            _weightKg = value; // Update the weight
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // Weight Display (kg/lbs)
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  '${_weightKg.round()}kg / ${weightLbs.round()}lbs',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
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
