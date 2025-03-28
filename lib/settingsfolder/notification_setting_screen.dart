import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  RxBool pushProfileVisits = false.obs;
  RxBool pushInterests = true.obs;
  RxBool pushMessages = true.obs;

  RxBool emailProfileVisits = false.obs;
  RxBool emailInterests = true.obs;
  RxBool emailMessages = true.obs;
  RxBool emailSmartEmails = true.obs;

  Widget _switchTile(String title, RxBool value) {
    return Obx(() => SwitchListTile(
          activeColor: Colors.blue,
          value: value.value,
          onChanged: (val) => value.value = val,
          title: AppText(
            text: title,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: AppText(
                text: "In-App Notification",
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ),
            ),
            _switchTile("Profile Visits", pushProfileVisits),
            const Divider(),
            _switchTile(" Interests", pushInterests),
            20.verticalSpace,
            Container(
              alignment: Alignment.centerLeft,
              child: AppText(
                text: "Push Notification",
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ),
            ),
            10.verticalSpace,
            _switchTile("Profile Visits", pushMessages),
            const Divider(),
            _switchTile("Interests", emailInterests),
            const Divider(),
            _switchTile("Messages", emailMessages),
            20.verticalSpace,
            Container(
              alignment: Alignment.center,
              child: AppText(
                text: "Notifications are disabled in settings",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            10.verticalSpace,
            Container(
              height: 50.h,
              width: 70.w,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: AppText(
                  text: "Enable",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
            // 20.verticalSpace,
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: AppText(
            //     text: "Emails",
            //     fontSize: 15.sp,
            //     fontWeight: FontWeight.w300,
            //     color: AppColors.black,
            //   ),
            // ),
            // 10.verticalSpace,
            30.verticalSpace,
            _switchTile("Smart Emails", emailSmartEmails),
            20.verticalSpace,
            AppText(
              text:
                  "smarts email will mute email notiification while you are using the app. To recieve all emails turn off smmart Emails",
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
