import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/onboardingfolder/showing_all_the_onboarding_screen.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const OnBoardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinksahdebackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/applogo.png",
                width: 1.sw,
                height: 150,
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 5,
                child: SpinKitThreeBounce(
                  color: AppColors.white,
                  size: 30.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
