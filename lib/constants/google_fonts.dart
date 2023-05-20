import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UseGoogleFont {
  openSans({Color? color, double? size, FontWeight? weight}) =>
      GoogleFonts.openSans(
        fontWeight: weight,
        color: color,
        fontSize: size,
      );
}
