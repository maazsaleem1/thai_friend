import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';
import 'package:thai_friendly_app/res/appcolors.dart';

class CustomFields extends StatelessWidget {
  final String input1;
  final String input2;
  const CustomFields({super.key, required this.input1, required this.input2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: input1,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          Row(
            children: [
              AppText(
                text: input2,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.pinksahdebackground,
              ),
              30.horizontalSpace,
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
