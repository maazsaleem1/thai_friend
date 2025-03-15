import 'package:flutter/material.dart';

import 'package:thai_friendly_app/res/appcolors.dart';

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff202020),
      iconTheme: IconThemeData(
        color: Colors.grey[400],
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 40, color: AppColors.white, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      displayMedium: TextStyle(fontSize: 32, color: AppColors.white, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_bold'),
      displaySmall: TextStyle(fontSize: 26, color: AppColors.white, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      headlineMedium: TextStyle(fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      headlineSmall: TextStyle(fontSize: 20, color: AppColors.white, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      titleLarge: TextStyle(fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      titleMedium: TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      bodyLarge: TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      bodyMedium: TextStyle(fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      bodySmall: TextStyle(fontSize: 10, color: AppColors.white, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      headlineLarge: TextStyle(fontSize: 26, color: AppColors.blue, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      labelMedium: TextStyle(fontSize: 25, color: AppColors.white, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic'),
      // subtitle1: TextStyle(
      //     fontSize: 14,
      //     color: AppColors.mediumwhite,
      //     fontWeight: FontWeight.w500,
      //     fontFamily: 'Bahij_TheSansArabic'),S
    ),
    colorScheme: ColorScheme.dark(
            primary: AppColors.blue,
            secondary: AppColors.black,
            tertiary: AppColors.darkGreyColor,
            surface: AppColors.grayishBlack,
            onPrimary: AppColors.white,
            onPrimaryContainer: AppColors.white,
            onSecondary: AppColors.mediumwhite,
            onSecondaryContainer: AppColors.darkcolourcontainer,
            outline: AppColors.mediumwhite,
            outlineVariant: AppColors.bordercolordark,
            background: AppColors.backgrounddark)
        .copyWith(surface: AppColors.darkGreyColor),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14, color: AppColors.darkGreyColor, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      labelStyle: TextStyle(fontSize: 14, color: AppColors.darkGreyColor, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 1, color: AppColors.darkGreyColor)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 1, color: AppColors.darkGreyColor)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(width: 1, color: AppColors.blue)),
    ));
