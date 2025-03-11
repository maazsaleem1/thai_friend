import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle interFont({
  color = Colors.white,
  fontsize = 14,
  fontweight = FontWeight.normal,
  decoration,
  decorationcolor,
  decorationstyle,
}) {
  return GoogleFonts.inter(
    color: color,
    fontSize: double.parse('$fontsize'),
    fontWeight: fontweight,
    decoration: decoration,
    decorationColor: decorationcolor,
    decorationStyle: decorationstyle,
  );
}
