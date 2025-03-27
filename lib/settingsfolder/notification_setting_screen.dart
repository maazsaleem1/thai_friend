import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          value: value.value,
          onChanged: (val) => value.value = val,
          title: Text(title),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _switchTile("Push Notifications for Profile Visits", pushProfileVisits),
        _switchTile("Push Notifications for Interests", pushInterests),
        _switchTile("Push Notifications for Messages", pushMessages),
        Divider(),
        _switchTile(
            "Email Notifications for Profile Visits", emailProfileVisits),
        _switchTile("Email Notifications for Interests", emailInterests),
        _switchTile("Email Notifications for Messages", emailMessages),
        _switchTile("Smart Emails", emailSmartEmails),
      ],
    );
  }
}
