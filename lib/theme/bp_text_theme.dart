import 'package:bisrepetita/theme/bp_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BPTextTheme {
  static final TextTheme defaultTextTheme = TextTheme(
    titleMedium: GoogleFonts.poppins(
        fontSize: 40, fontWeight: FontWeight.w200, color: BPColors.textColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 38, fontWeight: FontWeight.w200, color: BPColors.textColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 30, fontWeight: FontWeight.w200, color: BPColors.textColor),
    bodySmall: GoogleFonts.poppins(
        fontSize: 26, fontWeight: FontWeight.w300, color: BPColors.textColor),
    labelLarge: GoogleFonts.poppins(
        fontSize: 22, fontWeight: FontWeight.w300, color: BPColors.textColor),
    labelMedium: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w300, color: BPColors.textColor),
    labelSmall: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w300, color: BPColors.textColor),
  );
}
