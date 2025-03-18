import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';

class CustomWrapText extends StatelessWidget {
  const CustomWrapText({
    super.key,
    this.textontap,
    this.prefencestext = "",
    this.ifitsisselective = false,
    this.selectionforcolouronselect = false,
    this.textinthecontainer = "",
  });
  final VoidCallback? textontap;
  final bool ifitsisselective;
  final bool selectionforcolouronselect;
  final String textinthecontainer;
  final String prefencestext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: textontap,
      child:
          // bool isSelected = bookingcontroller.selectedIndex.value == index;
          Container(
        padding: EdgeInsets.symmetric(horizontal: ifitsisselective ? 15.w : 9.w, vertical: 8.h),
        margin: EdgeInsets.only(right: 8.w),
        decoration: ifitsisselective
            ? BoxDecoration(
                color: selectionforcolouronselect ? Colors.black : Colors.white,
                //  isSelected ? Appcolors.containerbackground : Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.blue),
              )
            : BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10.r),
              ),
        child: Center(
          child: ifitsisselective
              ? AppText(
                  text: textinthecontainer,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: selectionforcolouronselect
                      ? Colors.orange
                      : const Color(
                          0xff292A2D,
                        ),
                )
              : AppText(
                  text: prefencestext,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.orange,
                ),
        ),
      ),
    );
  }
}
