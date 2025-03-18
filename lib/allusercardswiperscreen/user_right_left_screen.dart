import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thai_friendly_app/controllers/userdetail_controllers.dart';
import 'package:thai_friendly_app/customs_widgets/app_input_field.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class AllUserCardSwiperScreen extends StatefulWidget {
  const AllUserCardSwiperScreen({super.key});

  @override
  State<AllUserCardSwiperScreen> createState() => _AllUserCardSwiperScreenState();
}

class _AllUserCardSwiperScreenState extends State<AllUserCardSwiperScreen> {
  CarouselSliderController buttonCarouselController = CarouselSliderController();
  final controller = Get.put(UserdetailControllers());

  int currentindex = 0;
  final List<Map<String, dynamic>> users = [
    {
      "name": "Mina301047",
      "age": "21",
      "location": "Bangkok - TH",
      "images": [
        "assets/images/girloneimage.jpg",
        "assets/images/girloneimage.jpg",
        "assets/images/girloneimage.jpg",
      ],
    },
    {
      "name": "Winexpws",
      "age": "24",
      "location": "Bang Bua Thong - TH",
      "images": [
        "assets/images/thaiboy.jpg",
        "assets/images/thaiboy.jpg",
        "assets/images/thaiboy.jpg",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        height: 1.sh,
        color: Theme.of(context).colorScheme.secondary,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [],
                  ),
                ),
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  height: 0.55.sh,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.r),
                    // color: Colors.amber,
                  ),
                  child: CardSwiper(
                    backCardOffset: const Offset(0, 0),
                    padding: EdgeInsets.zero,
                    cardsCount: users.length,
                    cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CarouselSlider(
                                  carouselController: buttonCarouselController,
                                  options: CarouselOptions(
                                    height: 0.55.sh,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    viewportFraction: 1.0, // Full width
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentindex = index;
                                      });
                                    },
                                  ),
                                  items: users.map((imageUrl) {
                                    return Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(imageUrl["images"][0]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),

                                /// **Dot Indicator**
                                Positioned(
                                  bottom: 10,
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: currentindex,
                                    count: users[index]["images"].length,
                                    effect: ExpandingDotsEffect(
                                      dotHeight: 8,
                                      dotWidth: 8,
                                      activeDotColor: Colors.white,
                                      dotColor: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  top: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: const Color(0xff8cfb78),
                                          ),
                                          child: const Center(
                                            child: AppText(
                                              textalignment: TextAlign.center,
                                              text: "Online",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: Theme.of(context).appBarTheme.backgroundColor,
                                          ),
                                          child: Center(
                                            child: AppText(
                                              textalignment: TextAlign.center,
                                              text: "2km",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w800,
                                              color: Theme.of(context).colorScheme.onPrimary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 40,
                                  left: 10,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: "Yoon650",
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                      AppText(
                                        text: "32/T/Bangkok,TH",
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                color: Theme.of(context).appBarTheme.backgroundColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    10.verticalSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: List.generate(
                                        3,
                                        (index) => SvgPicture.asset(
                                          "assets/images/heart.svg",
                                          color: Colors.red,
                                          height: 35,
                                        ),
                                      ),
                                    ),
                                    20.verticalSpace,
                                    AppText(
                                      text: "Want to meet, Want to meet, Want to Know Someone, eat, travel together",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                    30.verticalSpace,
                                    AppText(
                                      text: "Whatsapp +",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                    AppText(
                                      text: "Line ID =",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                    10.verticalSpace,
                                  ],
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.6),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  color: Theme.of(context).appBarTheme.backgroundColor,
                                ),
                                width: double.infinity, // Ensures the container takes the available width
                                child: Wrap(
                                  alignment: WrapAlignment.start, // Align items to the start
                                  children: List.generate(
                                    controller.languages.length,
                                    (index) => Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: index == 0 ? const Color(0xff8cfb78) : Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: AppText(
                                        text: controller.languages[index],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            const AppButton(
                              text: "View Profile",
                              backgroundColor: AppColors.buttoncolourforapp,
                              textColor: AppColors.white,
                            ),
                            30.verticalSpace
                          ],
                        ),
                      );
                    },
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/thaiboy.jpg"),
                          ),
                        ),
                      ),
                      // 10.horizontalSpace,
                      AppInput(
                        iffieldneedboxshadow: true,
                        thecolourwhichuserwriteintextfield: Theme.of(context).colorScheme.onPrimary,
                        horizontalMargin: 0,
                        bottomMargin: 10,
                        verticalPadding: 25,
                        placeHolder: "Send yoon650 a message",
                        backColor: Theme.of(context).appBarTheme.backgroundColor,
                        borderColor: Theme.of(context).appBarTheme.backgroundColor,
                        hintstylecolour: Theme.of(context).colorScheme.onPrimary,
                        inputWidth: 220.w,
                      ),
                      5.horizontalSpace,
                      Container(
                        height: 70.h,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.buttoncolourforapp,
                        ),
                        child: Center(
                          child: AppText(
                            text: "Send",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/crossicons.png',
                      height: 40.h,
                      color: Colors.red,
                    ),
                    SvgPicture.asset(
                      "assets/images/heart.svg",
                      color: Colors.red,
                      height: 35,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
