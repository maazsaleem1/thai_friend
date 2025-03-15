// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:thai_friendly_app/res/appcolors.dart';
import 'package:thai_friendly_app/res/fonts.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.greynew,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(
        color: const Color(0xff303030).withOpacity(0.5),
      ),
    ),
    colorScheme: const ColorScheme.light(
            primary: AppColors.grayishLightBlue,
            secondary: AppColors.white,
            tertiary: AppColors.lightGreyColor,
            onPrimary: AppColors.black,
            onPrimaryContainer: AppColors.greynew,
            background: AppColors.backgroundlight,
            onSecondaryContainer: AppColors.lightcolourcontainer,
            primaryContainer: AppColors.lightGreyColor,
            outline: AppColors.lightgrey,
            outlineVariant: AppColors.bordercolorlight,
            onSecondary: AppColors.black)
        .copyWith(surface: AppColors.white),
    textTheme: TextTheme(
      displayLarge: interFont(
        fontsize: 40,
        color: AppColors.grayishBlack,
        fontweight: FontWeight.w500,
      ),
      //  TextStyle(
      //
      //     fontFamily: 'Bahij_TheSansArabic_regular'),
      displayMedium: TextStyle(fontSize: 32, color: AppColors.grayishBlack, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_bold'),
      displaySmall: TextStyle(fontSize: 28, color: AppColors.grayishBlack, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      headlineMedium: TextStyle(fontSize: 25, color: AppColors.black, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      headlineSmall: TextStyle(fontSize: 20, color: AppColors.grayishBlack, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      titleLarge: TextStyle(fontSize: 18, color: AppColors.grayishBlack, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      titleMedium: TextStyle(fontSize: 17, color: AppColors.grayishBlack, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      bodyLarge: TextStyle(fontSize: 14, color: AppColors.grayishBlack, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      bodyMedium: TextStyle(fontSize: 12, color: AppColors.grayishBlack, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      bodySmall: TextStyle(fontSize: 10, color: AppColors.grayishBlack, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      headlineLarge: const TextStyle(fontSize: 26, color: AppColors.grayishBlue, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic'),
      labelMedium: TextStyle(fontSize: 25, color: AppColors.black, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      // subtitle1: TextStyle(
      //     fontSize: 14,
      //     color: AppColors.lightgrey,
      //     fontWeight: FontWeight.w500,
      //     fontFamily: 'Bahij_TheSansArabic'),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:
          const TextStyle(fontSize: 14, color: AppColors.lightGreyColor, fontWeight: FontWeight.w700, fontFamily: 'Bahij_TheSansArabic_regular'),
      labelStyle:
          const TextStyle(fontSize: 14, color: AppColors.lightGreyColor, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic_regular'),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1, color: AppColors.lightGreyColor)),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1, color: AppColors.lightGreyColor)),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1, color: AppColors.grayishBlue)),
    ));
