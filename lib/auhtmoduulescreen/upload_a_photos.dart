import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/auhtmoduulescreen/select_genders_screen.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/onboardingfolder/custom_button.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class UploadAPhotoScreen extends StatelessWidget {
  const UploadAPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pinksahdebackground,
        body: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  10.verticalSpace,
                  Container(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/images/backicon.svg",
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  25.verticalSpace,
                  AppText(
                    text: "Add Photo",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                  10.verticalSpace,
                  DottedBorder(
                    color: Colors.black,
                    dashPattern: const [5, 3],
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    child: Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/mediauplaodicon.svg"),
                        ],
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/checkmarkicon.svg",
                        color: AppColors.black,
                      ),
                      5.horizontalSpace,
                      AppText(
                        text: "Photos should clearly show your face",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/checkmarkicon.svg",
                        color: AppColors.black,
                      ),
                      5.horizontalSpace,
                      AppText(
                        text: "Photos should be of yourself",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.cancel,
                        color: AppColors.black,
                      ),
                      5.horizontalSpace,
                      AppText(
                        text: "No nudity, celebrities, or children",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20.h), // Adjust the space from the bottom
          child: BottomAppBar(
            clipBehavior: Clip.none,
            color: AppColors.pinksahdebackground,
            child: AppButton(
              onPress: () {
                Get.to(() => const SelectGenders());
              },
              horizontalMargin: 0,
              textColor: AppColors.white,
              fontsize: 18,
              text: "Upload Photo",
              backgroundColor: AppColors.orangebackgroundfortextandbutton,
            ),
          ),
        ));
  }
}
