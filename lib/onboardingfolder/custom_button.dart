import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:thai_friendly_app/res/fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.onPress,
    this.backgroundColor,
    this.buttonLoader = false,
    this.textColor = Colors.white,
    this.horizontalMargin = 20,
    this.texthorizontalMargin = 20,
    this.verticalMargin = 18,
    this.minWidth = 390.0, // Set the minimum width
    this.borderColor,
    super.key,
    this.fontsize = 16,
    this.loadersize = 30.0,
    this.textalignment = TextAlign.center,
    this.fontweight = FontWeight.w600,
    this.loadercolour = Colors.white,
  });

  final VoidCallback? onPress;
  final String text;
  final TextAlign textalignment;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? buttonLoader;
  final double? horizontalMargin;
  final double? texthorizontalMargin;
  final double? verticalMargin;
  final double minWidth; // Minimum width property
  final Color? borderColor;
  final int fontsize;
  final FontWeight fontweight;
  final Color loadercolour;
  final double loadersize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin!,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: backgroundColor,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              textStyle: interFont(
                color: textColor,
                fontsize: 16,
                fontweight: FontWeight.w600,
              ),
              padding: EdgeInsets.symmetric(
                vertical: verticalMargin!,
              ),
              elevation: 0,
              minimumSize: Size(minWidth == 0 ? 0 : minWidth, 0),
            ),
            onPressed: buttonLoader! ? null : onPress,
            child: buttonLoader!
                ? SpinKitFadingCircle(
                    color: loadercolour, // Replace with your desired color
                    size: loadersize, // Adjust size as needed
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: texthorizontalMargin!),
                    child: SizedBox(
                      // width: minWidth,
                      child: Text(
                        textAlign: textalignment,
                        text,
                        style: interFont(
                          color: textColor,
                          fontsize: fontsize,
                          fontweight: fontweight,
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
