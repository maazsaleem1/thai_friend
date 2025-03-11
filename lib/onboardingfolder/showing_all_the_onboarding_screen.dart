import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/join_thai_friendly_screen.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/onboardingfolder/on_boarding_screen_one.dart';
import 'package:thai_friendly_app/onboardingfolder/on_boarding_screen_three.dart';
import 'package:thai_friendly_app/onboardingfolder/on_boarding_screen_two.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentIndex.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinksahdebackground,
      body: SizedBox(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                currentIndex.value = index;
              },
              children: [
                OnBoardingScreenOne(pagecontroller: pageController),
                OnBoardingScreenTwo(pagecontroller: pageController),
                OnBoardingScreenThree(pagecontroller: pageController),
              ],
            ),
            Positioned(
              bottom: 30.h,
              child: Container(
                width: 1.sw,
                color: Colors.transparent,
                child: ValueListenableBuilder<int>(
                  valueListenable: currentIndex,
                  builder: (context, index, _) {
                    return Column(
                      children: [
                        AppButton(
                          verticalMargin: 13.h,
                          fontweight: FontWeight.w700,
                          onPress: () {
                            Get.to(() => const RegisterInTheApp());
                          },
                          textalignment: TextAlign.start,
                          text: "JOIN THAIFRIENDLY",
                          // backgroundColor: const Color(0xfff6a3a3),
                          backgroundColor: AppColors.yellowColor,
                          // backgroundColor: Appcolors.containerbackground,
                        ),
                        10.verticalSpace,
                        AppButton(
                          verticalMargin: 13.h,

                          fontweight: FontWeight.w500,
                          onPress: () {
                            if (index < 2) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              // Get.offAll(() => const LoginScreen());
                            }
                          },
                          textalignment: TextAlign.start,
                          text: "LOG IN",
                          backgroundColor: const Color(0xFF2B3A67),
                          // backgroundColor: AppColors.blue,
                          // backgroundColor: Appcolors.containerbackground,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
