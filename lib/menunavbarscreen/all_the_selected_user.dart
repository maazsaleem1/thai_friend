import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/EnterAppScreens/detailed_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/customs_widgets/custom_card_of_the_user.dart';
import 'package:thai_friendly_app/customs_widgets/custom_row_fields.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class SelectedUsersShowsHereScreen extends StatefulWidget {
  const SelectedUsersShowsHereScreen({super.key});

  @override
  State<SelectedUsersShowsHereScreen> createState() => _SelectedUsersShowsHereScreenState();
}

class _SelectedUsersShowsHereScreenState extends State<SelectedUsersShowsHereScreen> {
  final List<String> menuItems = [
    "Visited Me",
    "Liked Me",
    "My Favorites",
    "Favorited Me",
    "My Visits",
    "My Likes",
    "Saved Photos",
    "My Notes",
  ];
  final List<String> filters = [
    "RECENTLY ACTIVE",
    "HIDE MESSAGED",
    "NEW MEMBERS",
    "NEAR ME",
    "VERIFIED PHOTOS",
  ];
  RxBool checklist = true.obs;
  RxBool checkgridview = false.obs;
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
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
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
                        Row(
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
                            20.horizontalSpace,
                            Row(
                              children: [
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    // Handle selection
                                    print("Selected: $value");
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return menuItems.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                  child: const Row(
                                    children: [
                                      Text(
                                        "Matches",
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                AppInput(
                  thecolourwhichuserwriteintextfield: Theme.of(context).colorScheme.onPrimary,
                  verticalPadding: 10,
                  horizontalMargin: 10,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).appBarTheme.iconTheme?.color,
                  ),
                  placeHolder: "Search Name / City / Headline ",
                  backColor: Theme.of(context).appBarTheme.backgroundColor,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: filters.map((text) {
                        return OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            text,
                            style: const TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Obx(() {
                  return Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7, // Set an appropriate height
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
