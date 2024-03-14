import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontStyle {
  static TextStyle _textStyle(Color color, double size, FontWeight fontWeight,TextOverflow overflow) {
    return GoogleFonts.inter(
        color: color, fontSize: size, fontWeight: fontWeight);
  }

  static lightTextStyle(Color color, double size) {
    return _textStyle(color, size, FontWeight.w300,TextOverflow.ellipsis);
  }

  static regularTextStyle(Color color, double size) {
    return _textStyle(color, size, FontWeight.w400,TextOverflow.ellipsis);
  }

  static mediumTextStyle(Color color, double size) {
    return _textStyle(color, size, FontWeight.w500,TextOverflow.ellipsis);
  }

  static semiboldTextStyle(Color color, double size) {
    return _textStyle(color, size, FontWeight.w600,TextOverflow.ellipsis);
  }

  static boldTextStyle(Color color, double size) {
    return _textStyle(color, size, FontWeight.w700,TextOverflow.ellipsis);
  }
}
