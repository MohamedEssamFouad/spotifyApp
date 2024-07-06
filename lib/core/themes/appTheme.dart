import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'appColor.dart';

class AppTheme{

  static final lightTheme=ThemeData(

    primaryColor: AppcColor.primary,
    scaffoldBackgroundColor: AppcColor.lightbackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(

      filled: true,
      fillColor: Colors.transparent,
      contentPadding:EdgeInsets.all(30),
      hintStyle: TextStyle(
          color: Color(0xff383838),
          fontWeight: FontWeight.w500
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.6,
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.6,
          )
      ),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppcColor.primary,
        elevation: 0,
        textStyle: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30),
),
      ),

    ),
  );
  static final DarkTheme=ThemeData(
    primaryColor: AppcColor.primary,
    scaffoldBackgroundColor: AppcColor.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',

    inputDecorationTheme: InputDecorationTheme(

        filled: true,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(
          color: Color(0xffA7A7A7),
          fontWeight: FontWeight.w500
        ),
        contentPadding:EdgeInsets.all(30),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.6,
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 0.6,
          )
        ),

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppcColor.primary,
        elevation: 0,
        textStyle: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),

    ),
  );

}