import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thai_friendly_app/EnterAppScreens/search_screens.dart';
import 'package:thai_friendly_app/splash_Screen.dart';
import 'package:thai_friendly_app/themesfolder/dark_theme.dart';
import 'package:thai_friendly_app/themesfolder/light_theme.dart';
// ignore: depend_on_referenced_packages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const SearchScreens(),
      ),
    );
  }
}
