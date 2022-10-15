import 'package:books/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeOf(Color primaryColor) => ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      // shadowColor: AppColors.kPrimaryColor,
      backgroundColor: AppColors.lightBlue,
      toggleableActiveColor: AppColors.black,
      splashColor: primaryColor.withOpacity(0.2),
      splashFactory: NoSplash.splashFactory,
      highlightColor: primaryColor.withOpacity(0.1),
      typography: Typography(dense: Typography.dense2021),
      bottomAppBarColor: AppColors.lightBlue,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 18, color: Colors.black),
        unselectedIconTheme: IconThemeData(size: 18, color: Colors.black),
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: AppColors.black,
          )),
      tabBarTheme: const TabBarTheme(
        unselectedLabelStyle: TextStyle(fontSize: 12),
        labelStyle: TextStyle(fontSize: 12),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.sourceSerifPro(
          fontSize: 32,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        headline2: GoogleFonts.sourceSerifPro(
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.w800,
        ),
        headline3: GoogleFonts.sourceSerifPro(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        headline4: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        headline5: GoogleFonts.poppins(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
