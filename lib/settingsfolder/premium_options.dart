import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:thai_friendly_app/res/fancy%20textffield.dart';
import 'package:thai_friendly_app/settingsfolder/privacycontroller.dart';

class PremiumOptionsContent extends StatefulWidget {
  const PremiumOptionsContent({super.key});

  @override
  PremiumOptionsContentState createState() => PremiumOptionsContentState();
}

class PremiumOptionsContentState extends State<PremiumOptionsContent> {
  bool messagePriority = false;
  bool autoMessageLikes = false;
  TextEditingController messageController = TextEditingController(text: "Auto");
  final controller = Get.put(PrivacySettingsController());
  double _startAge = 18;
  double _endAge = 28;
  double _minAge = 18;
  double _maxAge = 33;
  bool showMeInSearch = true;
  bool applyAgeRange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            _buildHeader(context),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                      text: "Auto message Like",
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  const SizedBox(height: 20),
                  const AppText(
                      text:
                          "Automatically send a message to people when you like them in browse.",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  SwitchListTile(
                    activeColor: Colors.blue,
                    title: const Row(
                      children: [
                        Icon(Icons.smart_toy, color: Colors.red),
                        SizedBox(width: 8),
                        AppText(
                            text: "Auto message likes",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ],
                    ),
                    value: autoMessageLikes,
                    onChanged: (value) {
                      setState(() => autoMessageLikes = value);
                    },
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                      text:
                          "The following message will be sent when you like someone from browse - if username appears in the message it will be replaced with their username:",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  const SizedBox(height: 8),
                  // AppInput(
                  //   hintstylecolour: AppColors.black.withOpacity(0.7),
                  //   placeHolder: "Hi my name is ....",
                  //   backColor: AppColors.white,
                  //   horizontalMargin: 0,
                  //   verticalPadding: 20,
                  //   maxLenght: 5,
                  //   maxLines: 5,
                  // ),
                  FancyTextField(),
                  // TextField(
                  //   controller: messageController,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  20.verticalSpace,
                  5.verticalSpace,
                  const Divider(),
                  5.verticalSpace,
                  const AppText(
                      text: "Privacy",
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  const SizedBox(height: 20),
                  // const AppText(
                  //     text:
                  //         "Privacy options for premium members have moved to the privacy section in the sidebar",
                  //     fontSize: 13,
                  //     fontWeight: FontWeight.w400,
                  //     color: Colors.black),
                  // 10.verticalSpace,
                  // const Divider(),
                  // 10.verticalSpace,

                  const AppText(
                      text:
                          "Your messages will appear at the top of recipients inboxes - ahead of free members messages. This greatly increases your chance of a reply.",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  SwitchListTile(
                    activeColor: Colors.blue,
                    title: const Row(
                      children: [
                        Icon(Icons.email, color: Colors.blue),
                        SizedBox(width: 8),
                        AppText(
                            text: "Message Priority",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ],
                    ),
                    value: messagePriority,
                    onChanged: (value) {
                      setState(() => messagePriority = value);
                    },
                  ),
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

  Widget premiumFeature(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buildSwitch(title, value, onChanged)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
          child: const Text('PREMIUM',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('PREMIUM',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            Obx(() => Switch(
                  activeColor: Colors.blue,
                  value: toggle.value,
                  onChanged: (val) => isPremium
                      ? controller.handlePremiumToggle(toggle)
                      : toggle.value = val,
                )),
          ],
        ),
        const SizedBox(height: 16),
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
              text: "Premium Options",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ],
      ),
    );
  }
}
