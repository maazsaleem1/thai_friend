import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/EnterAppScreens/detailed_screen.dart';
import 'package:thai_friendly_app/EnterAppScreens/filterscreen.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/customs_widgets/custom_card_of_the_user.dart';
import 'package:thai_friendly_app/customs_widgets/custom_row_fields.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:thai_friendly_app/settingsfolder/privacy_opton_screen.dart';
import 'package:thai_friendly_app/settingsfolder/setting_screen.dart';
import 'package:thai_friendly_app/settingsfolder/premium_options.dart';

class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});

  @override
  State<SearchScreens> createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  RxBool checklist = true.obs;
  RxBool checkgridview = false.obs;
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: ,
      body: SafeArea(
        child: SliderDrawer(
          // sliderBoxShadow: SliderBoxShadow(
          //   color: Colors.black.withOpacity(0.2),
          //   blurRadius: 8,
          //   // offset: const Offset(0, 4),
          // ),
          isDraggable: false,
          key: _sliderDrawerKey,
          appBar: AppBar(
              // backgroundColor: Colors.transparent,
              ),
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
                                    color:
                                        Theme.of(context).colorScheme.onPrimary)
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
                        CustomRowFieldInDrawer(
                          ontap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16)),
                              ),
                              builder: (context) {
                                return const PremiumOptionsContent();
                              },
                            );
                          },
                          icon: Icons.star,
                          name: "Premium Options",
                          color: Colors.yellow,
                        ),
                        CustomRowFieldInDrawer(
                          ontap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16)),
                              ),
                              builder: (context) {
                                return const PrivacyOptionsScreen();
                              },
                            );
                          },
                          icon: Icons.visibility,
                          name: "Privacy Options",
                          color:
                              Theme.of(context).appBarTheme.iconTheme?.color ??
                                  Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          ontap: () {
                            Get.bottomSheet(
                              enableDrag: false,
                              isScrollControlled: true,
                              const SettingScreen(),
                            );
                          },
                          icon: Icons.settings,
                          name: "Settings",
                          color:
                              Theme.of(context).appBarTheme.iconTheme?.color ??
                                  Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.rate_review,
                          name: "Feedback",
                          color:
                              Theme.of(context).appBarTheme.iconTheme?.color ??
                                  Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.live_help_rounded,
                          name: "Help",
                          color:
                              Theme.of(context).appBarTheme.iconTheme?.color ??
                                  Colors.black,
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _sliderDrawerKey.currentState!.toggle();
                              },
                              child: Icon(
                                Icons.menu,
                                size: 35,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .iconTheme
                                    ?.color,
                              ),
                            ),
                            20.horizontalSpace,
                            SizedBox(
                              height: 40,
                              width: 80,
                              child: Row(
                                children: [
                                  Obx(() {
                                    return GestureDetector(
                                      onTap: () {
                                        checklist.value = true;
                                        checkgridview.value = false;
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                          color: checklist.value
                                              ? Theme.of(context)
                                                  .appBarTheme
                                                  .backgroundColor
                                              : AppColors.backgroundlight,
                                        ),
                                        child: Icon(
                                          Icons.grid_view,
                                          size: 25,
                                          color: checklist.value
                                              ? Colors.blueAccent
                                              : Theme.of(context)
                                                  .appBarTheme
                                                  .iconTheme
                                                  ?.color,
                                        ),
                                      ),
                                    );
                                  }),
                                  Obx(() {
                                    return GestureDetector(
                                      onTap: () {
                                        checklist.value = false;
                                        checkgridview.value = true;
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                          color: checkgridview.value
                                              ? Theme.of(context)
                                                  .appBarTheme
                                                  .backgroundColor
                                              : AppColors.backgroundlight,
                                        ),
                                        child: Icon(
                                          Icons.grid_4x4_rounded,
                                          size: 25,
                                          color: checkgridview.value
                                              ? Colors.blueAccent
                                              : Theme.of(context)
                                                  .appBarTheme
                                                  .iconTheme
                                                  ?.color,
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              ignoreSafeArea: true,
                              enableDrag: false,
                              isScrollControlled: true,
                              const FilterScreen(),
                            );
                          },
                          child: Icon(Icons.filter_list,
                              size: 28, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                AppInput(
                  thecolourwhichuserwriteintextfield:
                      Theme.of(context).colorScheme.onPrimary,
                  verticalPadding: 10,
                  horizontalMargin: 10,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).appBarTheme.iconTheme?.color,
                  ),
                  placeHolder: "Username Search",
                  backColor: Theme.of(context).appBarTheme.backgroundColor,
                ),
                Obx(() {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.7, // Set an appropriate height
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: checkgridview.value ? 3 : 2,
                        crossAxisSpacing: checkgridview.value ? 5 : 10,
                        mainAxisSpacing: checkgridview.value ? 5 : 10,
                        childAspectRatio: checkgridview.value ? 0.45 : 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => const DetailedUserScreen());
                              },
                              child: const CustomUserCard()),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
