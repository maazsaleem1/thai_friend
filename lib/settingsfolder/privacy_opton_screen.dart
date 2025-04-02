import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
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
  bool showMeInSearch = true;
  bool applyAgeRange = false;
  double ageRangeStart = 23;
  double ageRangeEnd = 47;
  bool sendReadReceipts = true;
  bool showMyVisits = true;
  bool appearOffline = false;
  double _startAge = 18;
  double _endAge = 28;
  double _minAge = 18;
  double _maxAge = 33;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  buildSwitch(
                      'Males looking for Females', malesLookingForFemales,
                      (value) {
                    setState(() => malesLookingForFemales = value);
                  }),
                  buildSwitch('Males looking for Males', malesLookingForMales,
                      (value) {
                    setState(() => malesLookingForMales = value);
                  }),
                  buildSwitch(
                      'Females looking for Males', femalesLookingForMales,
                      (value) {
                    setState(() => femalesLookingForMales = value);
                  }),
                  buildSwitch(
                      'Females looking for Females', femalesLookingForFemales,
                      (value) {
                    setState(() => femalesLookingForFemales = value);
                  }),
                  buildSwitch('Transgender', transgender, (value) {
                    setState(() => transgender = value);
                  }),
                  const Divider(),
                  buildSwitch('🇹🇭 Thailand Users Only', thailandUsersOnly,
                      (value) {
                    setState(() => thailandUsersOnly = value);
                  }),
                  premiumFeature('Show Me in Search', showMeInSearch, (value) {
                    setState(() => showMeInSearch = value);
                  }),
                  10.verticalSpace,
                  const Divider(),
                  10.verticalSpace,
                  const AppText(
                      text:
                          "Only show my profile to people who match my age range",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  10.verticalSpace,
                  buildSwitch('Apply Age Range', applyAgeRange, (value) {
                    setState(() => applyAgeRange = value);
                  }),
                  10.verticalSpace,
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
                  const Divider(),
                  10.verticalSpace,
                  privacyOption(
                      'Send Read Receipts', controller.sendReadReceipts, true),
                  privacyOption(
                      'Show My Visits', controller.showMyVisits, true),
                  privacyOption(
                      'Appear Offline', controller.appearOffline, true),
                  privacyOption(
                      'Show My Join Date', controller.showMyJoinDate, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
