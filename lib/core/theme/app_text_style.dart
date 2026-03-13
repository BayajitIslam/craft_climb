import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  //Size 32 Weight 700 Inter
  static TextStyle s32w7i({
    Color? color,
    double fontSize = 32.0,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppPallete.bodyText,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  //Size 24 Weight 700 Inter
  static TextStyle s24w7i({
    Color? color,
    double fontSize = 24.0,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppPallete.indigoNavy,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  //Size 16 Weight 400 Inter
  static TextStyle s16w4i({
    Color? color,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppPallete.subTextColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  //Size 14 Weight 400 Inter
  static TextStyle s14w4i({
    Color? color,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppPallete.extraAsh,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  //Size 12 Weight 400 Inter
  static TextStyle s12w4i({
    Color? color,
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppPallete.extraAsh,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  //Size 10 Weight 400 Inter
  static TextStyle s10w4i({
    Color? color,
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppPallete.extraAsh,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
