


import 'package:flutter/material.dart';
import 'package:thai_friendly_app/res/fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final VoidCallback? onTap;
  final bool isLoading;
  final TextAlign textalignment;
  final TextDecoration? underline;
  final TextOverflow? overflowtext;

  const AppText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.underline,
    this.textalignment = TextAlign.start,
    this.onTap,
    this.overflowtext,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: isLoading
          ? SizedBox(
              width: fontSize,
              height: fontSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: color,
              ),
            )
          : Text(
              textAlign: textalignment,
              text,
              overflow: overflowtext,
              style: interFont(
                decoration: underline,
                fontsize: fontSize,
                fontweight: fontWeight,
                color: color,
              ),
            ),
    );
  }
}
