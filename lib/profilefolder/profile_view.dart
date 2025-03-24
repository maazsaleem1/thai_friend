import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/customs_widgets/custom_row_fields.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class ProfileViewScreens extends StatefulWidget {
  const ProfileViewScreens({super.key});

  @override
  State<ProfileViewScreens> createState() => _ProfileViewScreensState();
}

class _ProfileViewScreensState extends State<ProfileViewScreens> {
  RxBool checklist = true.obs;
  RxBool checkgridview = false.obs;
  RxBool photos = false.obs;
  RxBool details = true.obs;
  RxBool reviews = false.obs;
  final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: ,
      body: SafeArea(
        child: SliderDrawer(
          isDraggable: false,
          key: _sliderDrawerKey,
          appBar: AppBar(),
          slider: Container(
            color: AppColors.backgroundlight,
            child: Column(
              children: [
                // this is the drawer

                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.2),
                    //     blurRadius: 8,
                    //     offset: const Offset(0, 4),
                    //   ),
                    // ],
                  ),
                ),
                2.verticalSpace,

                // this is the drawer profile description
                Container(
                  height: 150.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.2),
                    //     blurRadius: 8,
                    //     offset: const Offset(0, 4),
                    //   ),
                    // ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 150.h,
                        width: Get.width * 0.3,
                        decoration: const BoxDecoration(
                          color: AppColors.pinksahdebackground,
                          image: DecorationImage(
                            image: AssetImage('assets/images/thaiboy.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
                          AppText(
                            text: "JohnHardy",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          5.verticalSpace,
                          AppText(
                            text: "30,pattaya",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          10.verticalSpace,
                          AppText(
                            text: "Free Member",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: Get.width * 0.3,
                            color: AppColors.backgroundlight,
                            child: Row(
                              children: [
                                10.horizontalSpace,
                                const Icon(
                                  Icons.verified,
                                ),
                                10.horizontalSpace,
                                AppText(
                                    text: "Not Verified",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).colorScheme.onPrimary)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                40.verticalSpace,
                // thsi is the drawer inside with requirements

                Container(
                  height: 200,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.w,
                    ),
                    child: Column(
                      children: [
                        const CustomRowFieldInDrawer(
                          icon: Icons.star,
                          name: "Premium Options",
                          color: Colors.yellow,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.visibility,
                          name: "Privacy Options",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.settings,
                          name: "Settings",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.rate_review,
                          name: "Feedback",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.live_help_rounded,
                          name: "Help",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: Container(
            height: 1.sh,
            width: 1.sw,
            color: AppColors.backgroundlight,
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _sliderDrawerKey.currentState!.toggle();
                          },
                          child: Icon(
                            Icons.menu,
                            size: 35,
                            color: Theme.of(context).appBarTheme.iconTheme?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 75.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/thaiboy.jpg"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              text: "JohnHardy89",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            const AppText(
                              text: "Pattaya, Thailand",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.pinksahdebackground,
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.verified, color: Colors.grey, size: 14),
                                  SizedBox(width: 4),
                                  AppText(
                                    text: "Not Verified",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,
                Container(
                  width: Get.width * 0.9,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundlight,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            details.value = true;
                            photos.value = false;
                            reviews.value = false;
                          },
                          child: Container(
                            height: 40,
                            width: Get.width * 0.3,
                            color: details.value ? AppColors.white : Colors.transparent,
                            child: const Center(
                              child: AppText(
                                text: "DETAILS",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            photos.value = true;
                            details.value = false;
                            reviews.value = false;
                          },
                          child: Container(
                            height: 40,
                            width: Get.width * 0.3,
                            color: photos.value ? AppColors.white : Colors.transparent,
                            child: const Center(
                              child: AppText(
                                text: "PHOTOS",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            photos.value = false;
                            details.value = false;
                            reviews.value = true;
                          },
                          child: Container(
                            height: 40,
                            width: Get.width * 0.3,
                            color: reviews.value ? AppColors.white : Colors.transparent,
                            child: const Center(
                              child: AppText(
                                text: "REVIEWS",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                )
                ,20.verticalSpace,
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
