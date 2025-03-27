import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/EnterAppScreens/detailed_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/customs_widgets/custom_card_of_the_user.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class PrivacyScreen extends StatelessWidget {
  final RxInt selectedIndex = 0.obs; // Observable for tab selection

  final List<Widget> screens = [
    _blockedUsersTab(),
    _hiddenUsersTab(),
  ];

  final List<String> tabs = ["Blocked Users", "Hidden Users"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AppText(
                textalignment: TextAlign.center,
                text:
                    "Gender visibility option has moved to the privacy options section in the side menu ",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildTabBar(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() => screens[selectedIndex.value]),
            ),
          ],
        ),
      ),
    );
  }

  // Header Widget (Customize as needed)
  Widget _buildHeader(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Privacy"),
      backgroundColor: Colors.white,
    );
  }

  // Tab Bar Widget
  Widget _buildTabBar() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            tabs.length,
            (index) => GestureDetector(
              onTap: () {
                selectedIndex.value = index;
              },
              child: Column(
                children: [
                  Text(
                    tabs[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedIndex.value == index
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 3,
                    width: 80,
                    color: selectedIndex.value == index
                        ? Colors.blue
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // Blocked Users Tab Content
  static Widget _blockedUsersTab() {
    return const ListTile(
      title: AppText(
          text: "Helooo",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black),
    );
  }

  // Hidden Users Tab Content
  static Widget _hiddenUsersTab() {
    return SizedBox(
      height: 500, // Adjust height as needed
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const DetailedUserScreen());
              },
              child: const CustomUserCard(),
            ),
          );
        },
      ),
    );
  }
}
