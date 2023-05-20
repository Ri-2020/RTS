import 'package:flutter/material.dart';
import 'package:rts/constants/textstyles.dart';

bool isDarkMode = true;

class AppColors {
  AppColors._();
  static const Color primaryTextColorBlue = Color(0xFF173143);
  static const Color primaryTextColorGrey = Color(0xFF9D9D9D);
  static const Color actionColorLightGreen = Color(0xFF52CB8C);
  static const Color actionColorDarkGreen = Color(0xFF01B460);
  static const Color errorStateLightRed = Color(0xFFFF4C4C);
  static const Color errorStateBrightRed = Color(0xFFD0021B);
  static const Color highlighterPink = Color(0xFFFF6961);
  static const Color highlighterBlue = Color(0xFF69A7EE);
  static const Color highlighterBlueDark = Color(0xFF4990E2);
  static const Color highlighterGold = Color(0xFFE6DA71);
  static const Color highlighterGoldDark = Color(0xFFAB9355);
  static const Color gold = Color(0xFFd4af38);
  static const Color highlighterOrange = Color(0xFFD0021B);
  static const Color backgroundColorGrey = Color(0xFFEFEFEF);
  static const Color separatorGrey = Color(0xFFEAEAEA);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color persianColor = Color(0xFF00a890);
}

class ThemeConfig {
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightAccent = const Color(0xff2ca8e2);
  static Color darkAccent = const Color(0xff2ca8e2);
  static Color lightBG = Colors.white;
  static Color darkBG = const Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    canvasColor: Color(0xFF3a3a3b),
    backgroundColor: lightBG,
    // primaryColor: lightPrimary,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: lightBG,
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
    ),
    fontFamily: 'Open Sans',
    // fontFamily: 'Racing Sans One',

    appBarTheme: AppBarTheme(
      color: lightPrimary,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      color: darkPrimary,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyles.h1Heading,
      bodyText1: TextStyles.pageHeading,
      bodyText2: TextStyles.pageSubHeading,
      subtitle1: TextStyles.h1SubHeading,
      labelMedium: TextStyles.subText,
    ),
  );
}
