import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});

  @override
  State<SearchScreens> createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  RxBool checklist = true.obs;
  RxBool checkgridview = false.obs;
  final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SliderDrawer(
          sliderBoxShadow: SliderBoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            // offset: const Offset(0, 4),
          ),
          isDraggable: false,
          key: _sliderDrawerKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          slider: Column(
            children: [
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
              2.verticalSpace,
              Container(
                height: 150.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 150.h,
                      width: Get.width * 0.3,
                      color: AppColors.pinksahdebackground,
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
                          color: Colors.blue,
                          child: Row(
                            children: [
                              10.horizontalSpace,
                              const Icon(
                                Icons.verified,
                              ),
                              10.horizontalSpace,
                              AppText(
                                  text: "Not Verified", fontSize: 10.sp, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onPrimary)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
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
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                        color: checklist.value
                                            ? Theme.of(context).appBarTheme.backgroundColor
                                            : const Color(0xffF7F7F7).withOpacity(0.2),
                                      ),
                                      child: Icon(
                                        Icons.grid_view,
                                        size: 25,
                                        color: checklist.value ? Colors.blueAccent : Theme.of(context).appBarTheme.iconTheme?.color,
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
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                        color: checkgridview.value
                                            ? Theme.of(context).appBarTheme.backgroundColor
                                            : const Color(0xffF7F7F7).withOpacity(0.2),
                                      ),
                                      child: Icon(
                                        Icons.grid_4x4_rounded,
                                        size: 25,
                                        color: checkgridview.value ? Colors.blueAccent : Theme.of(context).appBarTheme.iconTheme?.color,
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.filter_list, size: 28, color: Colors.grey.shade800),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
