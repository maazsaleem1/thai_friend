import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thai_friendly_app/controllers/userdetail_controllers.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/customs_widgets/custom_fields_in_profile.dart';
import 'package:thai_friendly_app/customs_widgets/custom_row_fields.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class ProfileViewScreens extends StatefulWidget {
  const ProfileViewScreens({super.key});

  @override
  State<ProfileViewScreens> createState() => _ProfileViewScreensState();
}

class _ProfileViewScreensState extends State<ProfileViewScreens> {
  RxBool checklist = true.obs;
  RxBool checkgridview = false.obs;
  RxBool photos = false.obs;
  RxBool details = true.obs;
  RxBool reviews = false.obs;
  final List<String> imagePaths = [
    'assets/images/girloneimage.jpg',
    'assets/images/thaiboy.jpg',
    'assets/images/girlfour.jpg',
    'assets/images/girlfour.jpg',
  ];
  int currentindex = 0; // For tracking current slide index
  CarouselSliderController buttonCarouselController = CarouselSliderController();
  final controller = Get.put(UserdetailControllers());

  final List<String> imageUrls = [
    'assets/images/girloneimage.jpg',
  ];
  final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: ,
      body: SafeArea(
        child: SliderDrawer(
          isDraggable: false,
          key: _sliderDrawerKey,
          appBar: AppBar(),
          slider: Container(
            color: AppColors.backgroundlight,
            child: Column(
              children: [
                // this is the drawer

                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.2),
                    //     blurRadius: 8,
                    //     offset: const Offset(0, 4),
                    //   ),
                    // ],
                  ),
                ),
                2.verticalSpace,

                // this is the drawer profile description
                Container(
                  height: 150.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.2),
                    //     blurRadius: 8,
                    //     offset: const Offset(0, 4),
                    //   ),
                    // ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 150.h,
                        width: Get.width * 0.3,
                        decoration: const BoxDecoration(
                          color: AppColors.pinksahdebackground,
                          image: DecorationImage(
                            image: AssetImage('assets/images/thaiboy.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
                          AppText(
                            text: "JohnHardy",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          5.verticalSpace,
                          AppText(
                            text: "30,pattaya",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          10.verticalSpace,
                          AppText(
                            text: "Free Member",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: Get.width * 0.3,
                            color: AppColors.backgroundlight,
                            child: Row(
                              children: [
                                10.horizontalSpace,
                                const Icon(
                                  Icons.verified,
                                ),
                                10.horizontalSpace,
                                AppText(
                                    text: "Not Verified",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).colorScheme.onPrimary)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                40.verticalSpace,
                // thsi is the drawer inside with requirements

                Container(
                  height: 200,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.w,
                    ),
                    child: Column(
                      children: [
                        const CustomRowFieldInDrawer(
                          icon: Icons.star,
                          name: "Premium Options",
                          color: Colors.yellow,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.visibility,
                          name: "Privacy Options",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.settings,
                          name: "Settings",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.rate_review,
                          name: "Feedback",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                        CustomRowFieldInDrawer(
                          icon: Icons.live_help_rounded,
                          name: "Help",
                          color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: Container(
            height: 1.sh,
            width: 1.sw,
            color: AppColors.backgroundlight,
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _sliderDrawerKey.currentState!.toggle();
                          },
                          child: Icon(
                            Icons.menu,
                            size: 35,
                            color: Theme.of(context).appBarTheme.iconTheme?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 75.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("assets/images/thaiboy.jpg"),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppText(
                                      text: "JohnHardy89",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    const AppText(
                                      text: "Pattaya, Thailand",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.pinksahdebackground,
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.verified, color: Colors.grey, size: 14),
                                          SizedBox(width: 4),
                                          AppText(
                                            text: "Not Verified",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        30.verticalSpace,
                        Container(
                          width: Get.width * 0.9,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundlight,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Obx(() {
                                return GestureDetector(
                                  onTap: () {
                                    details.value = true;
                                    photos.value = false;
                                    reviews.value = false;
                                  },
                                  child: Container(
                                    height: 40,
                                    width: Get.width * 0.3,
                                    color: details.value ? AppColors.white : Colors.transparent,
                                    child: const Center(
                                      child: AppText(
                                        text: "DETAILS",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Obx(() {
                                return GestureDetector(
                                  onTap: () {
                                    photos.value = true;
                                    details.value = false;
                                    reviews.value = false;
                                  },
                                  child: Container(
                                    height: 40,
                                    width: Get.width * 0.3,
                                    color: photos.value ? AppColors.white : Colors.transparent,
                                    child: const Center(
                                      child: AppText(
                                        text: "PHOTOS",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              Obx(() {
                                return GestureDetector(
                                  onTap: () {
                                    photos.value = false;
                                    details.value = false;
                                    reviews.value = true;
                                  },
                                  child: Container(
                                    height: 40,
                                    width: Get.width * 0.3,
                                    color: reviews.value ? AppColors.white : Colors.transparent,
                                    child: const Center(
                                      child: AppText(
                                        text: "REVIEWS",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        Obx(() {
                          return Visibility(
                            visible: details.value,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.verified, color: Colors.blue),
                                            AppText(
                                              text: "Verify My Photos",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        AppText(
                                          textalignment: TextAlign.center,
                                          text: "Get a verified badge for your profile to show other \n members your photos are real!",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                40.verticalSpace,
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            text: "JohnHardy89 🇺🇸",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                          AppText(
                                            text: "30 / M / Pattaya, Thailand",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.pinksahdebackground,
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                                40.verticalSpace,
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            text: "Looking for fun while i am in\nThailand",
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                                40.verticalSpace,
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            textalignment: TextAlign.start,
                                            text: "Looking for transgender\naged between 23 and 30",
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.pinksahdebackground,
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                                60.verticalSpace,
                                const CustomFields(
                                  input1: 'Height',
                                  input2: '181cm / 5ft 11`',
                                ),
                                5.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(
                                    color: AppColors.pinksahdebackground.withOpacity(0.5),
                                  ),
                                ),
                                5.verticalSpace,
                                const CustomFields(
                                  input1: 'Weight',
                                  input2: '78kg / 172lbs',
                                ),
                                5.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(
                                    color: AppColors.pinksahdebackground.withOpacity(0.5),
                                  ),
                                ),
                                5.verticalSpace,
                                const CustomFields(
                                  input1: 'Education',
                                  input2: 'Master Degree',
                                ),
                                5.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(
                                    color: AppColors.pinksahdebackground.withOpacity(0.5),
                                  ),
                                ),
                                5.verticalSpace,
                                const CustomFields(
                                  input1: 'English Ability',
                                  input2: 'Fluent',
                                ),
                                5.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(
                                    color: AppColors.pinksahdebackground.withOpacity(0.5),
                                  ),
                                ),
                                5.verticalSpace,
                                const CustomFields(
                                  input1: 'Thai Ability',
                                  input2: 'None',
                                ),
                                5.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(
                                    color: AppColors.pinksahdebackground.withOpacity(0.5),
                                  ),
                                ),
                                5.verticalSpace,
                                const CustomFields(
                                  input1: 'Have Children',
                                  input2: 'No answer',
                                ),
                                5.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(
                                    color: AppColors.pinksahdebackground.withOpacity(0.5),
                                  ),
                                ),
                                5.verticalSpace,
                                const CustomFields(
                                  input1: 'Want Children',
                                  input2: 'No answer',
                                ),
                              ],
                            ),
                          );
                        }),
                        5.verticalSpace,
                        Obx(() {
                          return Visibility(
                              visible: photos.value,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.verified, color: Colors.blue),
                                              AppText(
                                                text: "Verify My Photos",
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          AppText(
                                            textalignment: TextAlign.center,
                                            text: "Get a verified badge for your profile to show other \n members your photos are real!",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  40.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 290.h,
                                      child: ReorderableGridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3, // 3 columns
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                          childAspectRatio: 1, // Square items
                                        ),
                                        itemCount: imagePaths.length + 2, // 4 images + 2 "Add" buttons
                                        itemBuilder: (context, index) {
                                          if (index < imagePaths.length) {
                                            return _buildImageItem(index);
                                          } else {
                                            return _buildAddPhotoButton(index);
                                          }
                                        },
                                        onReorder: (oldIndex, newIndex) {
                                          // Ensure we are moving only actual images, not the "Add" button
                                          if (oldIndex >= imagePaths.length || newIndex >= imagePaths.length) return;

                                          setState(() {
                                            final item = imagePaths.removeAt(oldIndex);
                                            imagePaths.insert(newIndex, item);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  AppText(
                                    text:
                                        "Upload more photos to get more messages! We\nrecommend at least 6 good photos. Tap and hold a\nphoto then drag to rearrange its position",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.pinksahdebackground,
                                  ),
                                  30.verticalSpace,
                                ],
                              ));
                        }),
                        5.verticalSpace,
                        Obx(() {
                          return Visibility(
                              visible: reviews.value,
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CarouselSlider(
                                        carouselController: buttonCarouselController,
                                        options: CarouselOptions(
                                          height: 400.0,
                                          enlargeCenterPage: true,
                                          viewportFraction: 1.0, // Full width
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              currentindex = index;
                                            });
                                          },
                                        ),
                                        items: imageUrls.map((imageUrl) {
                                          return Container(
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: AssetImage(imageUrl),
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
                                          count: imageUrls.length,
                                          effect: ExpandingDotsEffect(
                                            dotHeight: 8,
                                            dotWidth: 8,
                                            activeDotColor: Colors.white,
                                            dotColor: Colors.grey.shade400,
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
                                              color: AppColors.white,
                                            ),
                                            AppText(
                                              text: "32/T/Bangkok,TH",
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white,
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
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.black.withOpacity(0.6),
                                      //     blurRadius: 8,
                                      //     offset: const Offset(0, 2),
                                      //   ),
                                      // ],
                                      color: Theme.of(context).appBarTheme.backgroundColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          20.verticalSpace,
                                          const AppText(
                                            text: "Want to meet, Want to meet, Want to Know Someone, eat, travel together",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.black,
                                          ),
                                          30.verticalSpace,
                                        ],
                                      ),
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Container(
                                      decoration: BoxDecoration(
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
                                              color: index == 0 ? const Color(0xff8cfb78) : AppColors.backgroundlight,
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
                                  40.verticalSpace,
                                ],
                              ));
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageItem(int index) {
    return ClipRRect(
      key: ValueKey(imagePaths[index]),
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(imagePaths[index], fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          if (index == 0) // "Main Photo" label
            Positioned(
              bottom: 5,
              left: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.black54,
                child: const Text("Main Photo", style: TextStyle(color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoButton(int index) {
    return GestureDetector(
      key: ValueKey("add_button_$index"), // ✅ Unique key for add buttons
      onTap: () {
        // Handle image picking logic
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40, color: Colors.blue),
        ),
      ),
    );
  }
}
