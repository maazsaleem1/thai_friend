import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/EnterAppScreens/select_gender_selection_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _startAge = 18;
  double _endAge = 28;
  double _distance = 109;
  double _minDistance = 0;
  double _maxDistance = 300;
  bool verifiedPhotosOnly = false;
  bool excludeMessaged = false;
  bool showLikedMe = false;
  int selectedSearchOption = 0; // Default: Search by City/Place
  double _minAge = 18;
  double _maxAge = 33;
  RxInt selectedIndex = 0.obs;
  double _startHeight = 120;
  double _endHeight = 200;
  double _minHeight = 100;
  double _maxHeight = 220;
  double _startWeight = 30;
  double _endWeight = 125;
  double _minWeight = 20;
  double _maxWeight = 150;

  RxInt premiumselectedIndex = 0.obs;
  final List<String> tabs = ["ONLINE", "TODAY", "THISWEEK", "ANYTIME"];
  final List<String> premium = ["ALL MEMBERS", "NEW", "HOT"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundlight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 30.verticalSpace,
            Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const AppText(
                        text: "Close",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                    30.horizontalSpace,
                    const AppText(
                      text: "Search Settings",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            35.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Gender",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const GenderSelectionScreen());
                        },
                        child: Row(
                          children: [
                            const AppText(
                              text: "Women",
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                    thickness: 1,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Age Range",
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                      AppText(
                        text: "${_startAge.toInt()}-${_endAge.toInt()}",
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  FlutterSlider(
                    handlerHeight: 18, // Smaller thumb height
                    handlerWidth: 18,
                    values: [_startAge, _endAge],
                    rangeSlider: true,
                    min: _minAge,
                    max: _maxAge,
                    handler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                          // padding: const EdgeInsets.all(10),
                          ),
                    ),
                    trackBar: const FlutterSliderTrackBar(
                      activeTrackBarHeight: 1,
                      activeTrackBar: BoxDecoration(color: Colors.blue),
                      inactiveTrackBar: BoxDecoration(color: Colors.grey),
                    ),
                    tooltip: FlutterSliderTooltip(
                      textStyle: const TextStyle(color: Colors.white),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        _startAge = lowerValue;
                        _endAge = upperValue;
                      });
                    },
                  ),
                  10.verticalSpace,
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.blue,
                    value: verifiedPhotosOnly,
                    onChanged: (val) => setState(() => verifiedPhotosOnly = val),
                    title: AppText(
                      text: "Verified Photos Only",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  10.verticalSpace,
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.blue,
                    value: excludeMessaged,
                    onChanged: (val) => setState(() => excludeMessaged = val),
                    title: AppText(
                      text: "Exclude messaged already",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  10.verticalSpace,
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    activeColor: Colors.blue,
                    value: showLikedMe,
                    onChanged: (val) => setState(() => showLikedMe = val),
                    title: AppText(
                      text: "Show only who liked me",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  20.verticalSpace,
                  _buildTabBar(),
                  const SizedBox(height: 20),
                  _searchOption(0, "Search Near Me"),
                  _searchOption(1, "Search Everywhere"),
                  _searchOption(2, "Search by City / Place"),
                  if (selectedSearchOption == 2) ...[
                    const SizedBox(height: 10),
                    const AppText(textalignment: TextAlign.left, text: "Pattaya", fontSize: 15, fontWeight: FontWeight.w300, color: AppColors.black),
                    const SizedBox(height: 10),
                    // Map Placeholder
                    Container(
                      height: 150,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/download.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  25.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Distance",
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                      AppText(
                        text: "${_distance.toInt()} km",
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  FlutterSlider(
                    handlerHeight: 18, // Smaller thumb height
                    handlerWidth: 18,
                    values: [_distance],
                    min: _minDistance,
                    max: _maxDistance,
                    handler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                      inactiveTrackBar: const BoxDecoration(color: Colors.grey),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        _distance = lowerValue;
                      });
                    },
                  ),
                  50.verticalSpace,
                  const AppText(
                    textalignment: TextAlign.left,
                    text: "Premium Search",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: AppColors.black,
                  ),
                  20.verticalSpace,
                  premiumtabbar(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Height",
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                      AppText(
                        text: "${_startHeight.toInt()} - ${_endHeight.toInt()} cm",
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  FlutterSlider(
                    handlerHeight: 18, // Smaller thumb height
                    handlerWidth: 18,
                    values: [_startHeight, _endHeight],
                    rangeSlider: true,
                    min: _minHeight,
                    max: _maxHeight,
                    handler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                          // padding: const EdgeInsets.all(10),
                          ),
                    ),
                    trackBar: const FlutterSliderTrackBar(
                      activeTrackBarHeight: 1,
                      activeTrackBar: BoxDecoration(color: Colors.blue),
                      inactiveTrackBar: BoxDecoration(color: Colors.grey),
                    ),
                    tooltip: FlutterSliderTooltip(
                      textStyle: const TextStyle(color: Colors.white),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        _startHeight = lowerValue;
                        _endHeight = upperValue;
                      });
                    },
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Weight",
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                      AppText(
                        text: "${_startWeight.toInt()} - ${_endWeight.toInt()} kg",
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  FlutterSlider(
                    handlerHeight: 18, // Smaller thumb height
                    handlerWidth: 18,
                    values: [_startWeight, _endWeight],
                    rangeSlider: true,
                    min: _minWeight,
                    max: _maxWeight,
                    handler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                    rightHandler: FlutterSliderHandler(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                          // padding: const EdgeInsets.all(10),
                          ),
                    ),
                    trackBar: const FlutterSliderTrackBar(
                      activeTrackBarHeight: 1,
                      activeTrackBar: BoxDecoration(color: Colors.blue),
                      inactiveTrackBar: BoxDecoration(color: Colors.grey),
                    ),
                    tooltip: FlutterSliderTooltip(
                      textStyle: const TextStyle(color: Colors.white),
                      boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                        _startWeight = lowerValue;
                        _endWeight = upperValue;
                      });
                    },
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "No Children",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const AppText(
                              text: "Any",
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                    thickness: 1,
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Wants Children",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const AppText(
                              text: "Any",
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                    thickness: 1,
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Education",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const AppText(
                              text: "Any",
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                    thickness: 1,
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "English Language Ability",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const AppText(
                              text: "Any",
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.2),
                    thickness: 1,
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text: "Respect Their Age Range",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const AppText(
                              text: "Any",
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          tabs.length,
          (index) => _buildTabItem(tabs[index], index, false),
        ),
      );
    });
  }

  Widget premiumtabbar() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          premium.length,
          (index) => _buildTabItem(premium[index], index, true),
        ),
      );
    });
  }

  Widget _buildTabItem(String title, int index, bool isfrom) {
    return GestureDetector(
      onTap: () => selectedIndex.value = index,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: isfrom ? Get.width * 0.29 : Get.width * 0.21,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: selectedIndex.value == index ? AppColors.orangebackgroundfortextandbutton : AppColors.pinksahdebackground,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 3.h,
            width: selectedIndex.value == index ? Get.width * 0.2 : 0,
            color: selectedIndex.value == index ? AppColors.pinksahdebackground : Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Time Filter Button

  // Search Option Radio Button
  Widget _searchOption(int value, String text) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      title: AppText(text: text, fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.black),
      value: value,
      groupValue: selectedSearchOption,
      onChanged: (int? newValue) {
        setState(() {
          selectedSearchOption = newValue!;
        });
      },
      activeColor: Colors.blue,
    );
  }
}
