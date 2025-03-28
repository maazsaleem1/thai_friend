import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:thai_friendly_app/settingsfolder/alignment_setting_screen.dart';
import 'package:thai_friendly_app/settingsfolder/app_setting_screen.dart';
import 'package:thai_friendly_app/settingsfolder/notification_setting_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    const AppSettingsScreen(),
    const NotificationSettingsScreen(),
    PrivacyScreen(),
  ];

  final List<String> tabs = ["APP", "NOTIFICATION", "PRIVACY"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundlight,
        body: Column(
          children: [
            30.verticalSpace,
            _buildHeader(context),
            SizedBox(height: 20.h),
            _buildTabBar(),
            20.verticalSpace,
            Expanded(
              child: Obx(() => screens[selectedIndex.value]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 50.h,
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: AppText(
                  text: "Close",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue)),
          20.horizontalSpace,
          AppText(
              text: "Accounts",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          tabs.length,
          (index) => _buildTabItem(tabs[index], index),
        ),
      );
    });
  }

  Widget _buildTabItem(String title, int index) {
    return GestureDetector(
      onTap: () => selectedIndex.value = index,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: Get.width * 0.3,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: selectedIndex.value == index
                      ? AppColors.orangebackgroundfortextandbutton
                      : AppColors.pinksahdebackground,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 3.h,
            width: selectedIndex.value == index ? Get.width * 0.2 : 0,
            color: selectedIndex.value == index
                ? AppColors.pinksahdebackground
                : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
