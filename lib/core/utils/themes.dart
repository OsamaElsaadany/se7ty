

import 'package:flutter/material.dart';
import 'package:se7ty/core/constants/appfonts.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: const Color.from(alpha: 1, red: 1, green: 1, blue: 1),
    fontFamily: AppFonts.cairo,
    appBarTheme: AppBarTheme(
      backgroundColor: appcolor.whitecolor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: appcolor.primarycolor,
      onSurface: appcolor.darkcolor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appcolor.whitecolor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    dividerTheme: DividerThemeData(color: appcolor.bgcolor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: appcolor.accentColor,
      filled: true,
      hintStyle: TextStyles.styleSize14.copyWith(color: appcolor.graycolor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: appcolor.bgcolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: appcolor.bgcolor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: appcolor.redcolor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: appcolor.redcolor),
      ),
    ),
  );
}