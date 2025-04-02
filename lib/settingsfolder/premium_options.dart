import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class PremiumOptionsContent extends StatefulWidget {
  const PremiumOptionsContent({super.key});

  @override
  PremiumOptionsContentState createState() => PremiumOptionsContentState();
}

class PremiumOptionsContentState extends State<PremiumOptionsContent> {
  bool messagePriority = false;
  bool autoMessageLikes = false;
  TextEditingController messageController = TextEditingController(text: "Auto");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      body: Column(
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
                    text: "Features",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                const SizedBox(height: 10),
                const AppText(
                    text:
                        "Your messages will appear at the top of recipients inboxes - ahead of free members messages. This greatly increases your chance of a reply.",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                SwitchListTile(
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
                5.verticalSpace,
                const Divider(),
                5.verticalSpace,
                const AppText(
                    text: "Privacy",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                const SizedBox(height: 20),
                const AppText(
                    text:
                        "Privacy options for premium members have moved to the privacy section in the sidebar",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                10.verticalSpace,
                const Divider(),
                10.verticalSpace,
                const AppText(
                    text: "Experimental Features",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                const SizedBox(height: 20),
                const AppText(
                    text:
                        "Automatically send a message to people when you like them in browse.",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                SwitchListTile(
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
                TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
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
              text: "Premium Options",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ],
      ),
    );
  }
}
