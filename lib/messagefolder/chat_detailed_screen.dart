import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class ChatDetailedScreen extends StatefulWidget {
  const ChatDetailedScreen({super.key});

  @override
  State<ChatDetailedScreen> createState() => _ChatDetailedScreenState();
}

class _ChatDetailedScreenState extends State<ChatDetailedScreen> {
  final List<String> imageUrls = [
    'assets/images/girloneimage.jpg',
    'assets/images/girloneimage.jpg',
    'assets/images/girloneimage.jpg',
    'assets/images/girloneimage.jpg',
    'assets/images/girloneimage.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundlight, // Light blue background
          height: 1.sh,
          child: Column(
            children: [
              Container(
                height: 100,
                color: AppColors.white,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          "assets/images/backicon.svg",
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Container(
                      height: 90.h,
                      width: 279,
                      color: AppColors.backgroundlight,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: "Bowling877",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.black,
                                ),
                                5.verticalSpace,
                                AppText(
                                  text: "19/T/Pattaya",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                                5.verticalSpace,
                                AppText(
                                  text: "online 12 hours ago",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.pinksahdebackground,
                                ),
                              ],
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imageUrls.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    width: Get.width * 0.15,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/thaiboy.jpg',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.horizontalSpace,
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.blue,
                      size: 50,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8C5), // Light yellow
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("💰 Never give money or share private info"),
                    Text("🚩 Report scammers or stranger danger"),
                    Text("📍 Only meet in public + bring a friend"),
                  ],
                ),
              ),

              // Chat messages
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "1 week ago",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            minRadius: 20,
                            backgroundImage: AssetImage(
                              'assets/images/thaiboy.jpg',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFA6E7), // Light pink
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text("Hello"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Message Input Field
              Container(
                // padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    const AppInput(
                      verticalPadding: 0,
                      placeHolder: "Message",
                      backColor: AppColors.white,
                      borderColor: Colors.transparent,
                      horizontalMargin: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.emoji_emotions, color: Colors.blue),
                          20.horizontalSpace,
                          const Icon(Icons.gif, color: Colors.blue),
                          20.horizontalSpace,
                          const Icon(Icons.camera_alt, color: Colors.blue),
                          20.horizontalSpace,
                          const Icon(Icons.mic, color: Colors.blue),
                          20.horizontalSpace,
                          const Spacer(),
                          const Text(
                            "Send",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
