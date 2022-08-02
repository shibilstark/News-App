import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      cardColor: Color.fromARGB(255, 255, 101, 101),
      // cardColor: Color.fromARGB(158, 255, 85, 85),
      appBarTheme: AppBarTheme(backgroundColor: smoothWhite),
      fontFamily: "myFont",
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold, color: softBlack, fontSize: 22.sm),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w500, color: softBlack, fontSize: 17.sm),
        titleSmall: TextStyle(
            fontWeight: FontWeight.w500, color: themeDark, fontSize: 17.sm),
      ));

  //
  // dark
  static ThemeData darkTheme = ThemeData(
    fontFamily: "myFont",
    scaffoldBackgroundColor: softBlack,
    appBarTheme: AppBarTheme(backgroundColor: themeDark),
    cardColor: Color.fromARGB(255, 255, 101, 101),
    // cardColor: Color.fromARGB(66, 251, 251, 251),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.w600, color: pureWhite, fontSize: 22.sm),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w500, color: smoothWhite, fontSize: 17.sm),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w500, color: smoothWhite, fontSize: 17.sm),
    ),
  );
}

enum MyThemeMode { light, dark }
