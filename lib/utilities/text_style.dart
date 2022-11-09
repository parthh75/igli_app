import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData themeData = getCommonStyle();
getCommonStyle() {
  return ThemeData(
    fontFamily: GoogleFonts.getFont('Roboto Slab').fontFamily,
    textTheme: TextTheme(
      subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: colorFFFFFF),
      subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textColorPrimary),
      headline1: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: textColorPrimary),
      headline2: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: colorPrimary),
      headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: textColorPrimary),
      headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: textColorPrimary),
      headline5: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: textColorPrimary),
      headline6: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500, color: textColorPrimary),
      button: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: colorFFFFFF),
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: colorFFFFFF),
      bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: textColorPrimary),
    ),
  );
}
