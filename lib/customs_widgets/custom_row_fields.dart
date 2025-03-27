import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';

class CustomRowFieldInDrawer extends StatelessWidget {
  // final Icons icon;
  final IconData icon;
  final String name;
  final Color color;
  final VoidCallback? ontap;

  const CustomRowFieldInDrawer(
      {super.key,
      required this.icon,
      required this.name,
      required this.color,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            40.horizontalSpace,
            AppText(
              text: name,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            )
          ],
        ),
      ),
    );
  }
}
