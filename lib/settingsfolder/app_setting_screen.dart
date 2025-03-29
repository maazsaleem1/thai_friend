import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:thai_friendly_app/settingsfolder/change_usrename_screen.dart';
import 'package:thai_friendly_app/settingsfolder/delete_account_screen.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  _AppSettingsScreenState createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool switchTheme = false;
  bool darkMode = false;
  bool imperialUnits = false;
  bool googleLogin = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              activeColor: Colors.blue,
              value: switchTheme,
              onChanged: (val) => setState(() => switchTheme = val),
              title: AppText(
                text: "Switch Theme Automatically",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),

              // const Text("Switch Theme Automatically"),
            ),
            const Divider(),
            SwitchListTile(
              activeColor: Colors.blue,
              value: darkMode,
              onChanged: (val) => setState(() => darkMode = val),
              title: AppText(
                text: "Dark Mode",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const Divider(),
            SwitchListTile(
              activeColor: Colors.blue,
              value: imperialUnits,
              onChanged: (val) => setState(() => imperialUnits = val),
              title: AppText(
                text: "Imperial Units (miles etc)",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            AppText(
              text: "Login Method",
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.black,
            ),
            5.verticalSpace,
            SwitchListTile(
              activeColor: Colors.blue,
              value: googleLogin,
              onChanged: (val) => setState(() => googleLogin = val),
              title: AppText(
                text: "Log in with Google",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const Divider(),
            ListTile(
                title: AppText(
                  text: "Log in with Email",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                )),
            const Divider(),
            GestureDetector(
              onTap: () {
                Get.to(() => ChangeUsernameScreen());
              },
              child: ListTile(
                  title: AppText(
                    text: "Change Username",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  )),
            ),
            const Divider(),
            ListTile(
                title: AppText(
                  text: "Restore Purchases",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                )),
            const Divider(),
            ListTile(
              title: AppText(
                text: "Log Out",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const Divider(),
            ListTile(
              title: AppText(
                text: "Turn Off Profile",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Get.to(const DeleteAccountScreen());
              },
              child: ListTile(
                title: AppText(
                  text: "Delete Account",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: AppText(
                text: "Terms and Conditions",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const Divider(),
            ListTile(
              title: AppText(
                text: "Privacy Policy",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const Divider(),
            ListTile(
              title: AppText(
                text: "Dating Safety",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const Divider(),
            ListTile(
              title: AppText(
                text: "Community Guidelines",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
