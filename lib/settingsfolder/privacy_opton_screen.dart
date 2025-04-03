import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:thai_friendly_app/settingsfolder/privacycontroller.dart';

class PrivacyOptionsScreen extends StatefulWidget {
  const PrivacyOptionsScreen({super.key});

  @override
  _PrivacyOptionsScreenState createState() => _PrivacyOptionsScreenState();
}

class _PrivacyOptionsScreenState extends State<PrivacyOptionsScreen> {
  final controller = Get.put(PrivacySettingsController());
  bool malesLookingForFemales = true;
  bool malesLookingForMales = true;
  bool femalesLookingForMales = true;
  bool femalesLookingForFemales = true;
  bool transgender = true;
  bool thailandUsersOnly = false;
  bool applyAgeRange = false;
  double ageRangeStart = 23;
  double ageRangeEnd = 47;
  bool sendReadReceipts = true;
  bool showMyVisits = true;
  bool appearOffline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      30.verticalSpace,
      _buildHeader(context),
      20.verticalSpace,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
                text: "Search Control",
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const AppText(
                text:
                    "The following groups of people are able to see your profile in search and send you messages:",
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black),
            30.verticalSpace,
            buildSwitch('Males looking for Females', malesLookingForFemales,
                (value) {
              setState(() => malesLookingForFemales = value);
            }),
            buildSwitch('Males looking for Males', malesLookingForMales,
                (value) {
              setState(() => malesLookingForMales = value);
            }),
            buildSwitch('Females looking for Males', femalesLookingForMales,
                (value) {
              setState(() => femalesLookingForMales = value);
            }),
            buildSwitch('Females looking for Females', femalesLookingForFemales,
                (value) {
              setState(() => femalesLookingForFemales = value);
            }),
            buildSwitch('Transgender', transgender, (value) {
              setState(() => transgender = value);
            }),
            const Divider(),
            buildSwitch('🇹🇭 Thailand Users Only', thailandUsersOnly, (value) {
              setState(() => thailandUsersOnly = value);
            }),
          ],
        ),
      )
    ])));
  }

  Widget buildSwitch(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      activeColor: Colors.blue,
      title: AppText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget privacyOption(String title, RxBool toggle, bool isPremium) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isPremium)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('PREMIUM',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            Obx(() => Switch(
                  value: toggle.value,
                  onChanged: (val) => isPremium
                      ? controller.handlePremiumToggle(toggle)
                      : toggle.value = val,
                )),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget premiumFeature(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buildSwitch(title, value, onChanged)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
          child: Text('PREMIUM', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
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
              text: "Privacy Options",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ],
      ),
    );
  }
}
