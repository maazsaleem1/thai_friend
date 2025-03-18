import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thai_friendly_app/customs_widgets/app_text.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 150.h,
            decoration: const BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                image: AssetImage('assets/images/girloneimage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
              AppText(
                text: "Yoon650",
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
          AppText(
            text: "24.T Bangkok - 7Km",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          AppText(
            text: "23 Seconds Ago",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/crossicons.png',
                height: 30.h,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
              ),
              Image.asset(
                'assets/images/heartwithoutfill.png',
                height: 30.h,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
              ),

              // Icon(
              //   Icons.cancel,

              // ),
            ],
          )
        ],
      ),
    );
  }
}
