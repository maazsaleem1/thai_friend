import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icon_button/tap_fill_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thai_friendly_app/controllers/userdetail_controllers.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class DetailedUserScreen extends StatefulWidget {
  const DetailedUserScreen({super.key});

  @override
  State<DetailedUserScreen> createState() => _DetailedUserScreenState();
}

class _DetailedUserScreenState extends State<DetailedUserScreen> {
  final controller = Get.put(UserdetailControllers());
  int currentindex = 0; // For tracking current slide index
  CarouselSliderController buttonCarouselController = CarouselSliderController();
  final List<String> imageUrls = [
    'assets/images/girloneimage.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundlight,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          height: 400.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0, // Full width
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentindex = index;
                            });
                          },
                        ),
                        items: imageUrls.map((imageUrl) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      /// **Dot Indicator**
                      Positioned(
                        bottom: 10,
                        child: AnimatedSmoothIndicator(
                          activeIndex: currentindex,
                          count: imageUrls.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: Colors.white,
                            dotColor: Colors.grey.shade400,
                          ),
                        ),
                      ),

                      Positioned(
                        left: 10,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Icon(Icons.arrow_back_sharp, color: Theme.of(context).colorScheme.onPrimary, size: 30),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Yoon650",
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            AppText(
                              text: "32/T/Bangkok,TH",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  const AppButton(
                    horizontalMargin: 0,
                    text: "Chat With Sai360",
                    backgroundColor: AppColors.orangebackgroundfortextandbutton,
                    textColor: Colors.white,
                    fontweight: FontWeight.w800,
                  ),
                  20.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black.withOpacity(0.6),
                      //     blurRadius: 8,
                      //     offset: const Offset(0, 2),
                      //   ),
                      // ],
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              3,
                              (index) => SvgPicture.asset(
                                "assets/images/heart.svg",
                                color: Colors.red,
                                height: 35,
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          AppText(
                            text: "Want to meet, Want to meet, Want to Know Someone, eat, travel together",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          30.verticalSpace,
                          AppText(
                            text: "Whatsapp +",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          AppText(
                            text: "Line ID =",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          10.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  // Container(
                  //   height: 60,
                  //   child: SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: Row(
                  //       children: List.generate(
                  //         controller.languages.length,
                  //         (index) => CustomWrapText(
                  //           ifitsisselective: false,
                  //           prefencestext: controller.languages[index],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      width: double.infinity, // Ensures the container takes the available width
                      child: Wrap(
                        alignment: WrapAlignment.start, // Align items to the start
                        children: List.generate(
                          controller.languages.length,
                          (index) => Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                              color: index == 0 ? const Color(0xff8cfb78) : AppColors.backgroundlight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: AppText(
                              text: controller.languages[index],
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      width: double.infinity, // Ensures the container takes the available width
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: AppText(
                              text: "Your Private notes for Yoon650",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          // 10.verticalSpace,
                          AppInput(
                            verticalPadding: 25,
                            placeHolder: "Enter your privates notes here only you can see them",
                            backColor: AppColors.white,
                            borderColor: AppColors.pinksahdebackground,
                            thecolourwhichuserwriteintextfield: Theme.of(context).colorScheme.onPrimary,
                          )
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      AppButton(
                        text: "Report",
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        textColor: AppColors.orangebackgroundfortextandbutton,
                        borderColor: AppColors.orangebackgroundfortextandbutton,
                        fontweight: FontWeight.w900,
                        minWidth: 170.w,
                      ),
                      AppButton(
                        horizontalMargin: 0,
                        text: "Block",
                        fontweight: FontWeight.w900,
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        textColor: AppColors.orangebackgroundfortextandbutton,
                        borderColor: AppColors.orangebackgroundfortextandbutton,
                        minWidth: 170.w,
                      ),
                    ],
                  ),

                  100.verticalSpace
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 30,
              child: Container(
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 45,
                      width: 90,
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/crossicons.png',
                              height: 40.h,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 90,
                      color: AppColors.white,
                      child: const Column(
                        children: [
                          Center(
                            child: TapFillIcon(
                              borderIcon: Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                                size: 40,
                              ),
                              fillIcon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 90,
                      color: AppColors.white,
                      child: const Column(
                        children: [
                          Center(
                            child: TapFillIcon(
                              borderIcon: Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 40,
                              ),
                              fillIcon: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
