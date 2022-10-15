import 'package:books/shared/helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeOf(Color primaryColor) => ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      shadowColor: AppColors.white,
      backgroundColor: AppColors.black.withOpacity(.3),
      toggleableActiveColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.black),
      highlightColor: primaryColor.withOpacity(0.1),
      appBarTheme: AppBarTheme(backgroundColor: Colors.black12),
      typography: Typography(dense: Typography.dense2021),
      bottomAppBarColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 18, color: Colors.black),
        unselectedIconTheme: IconThemeData(size: 18, color: Colors.white),
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      tabBarTheme: const TabBarTheme(
        unselectedLabelStyle: TextStyle(fontSize: 12),
        labelStyle: TextStyle(fontSize: 12),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white60,
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.sourceSerifPro(
          fontSize: 32,
          color: AppColors.kTextLight,
          fontWeight: FontWeight.bold,
        ),
        headline2: GoogleFonts.sourceSerifPro(
          color: AppColors.kTextLight,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        headline3: GoogleFonts.sourceSerifPro(
          color: AppColors.kTextLight,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.poppins(
          color: AppColors.kTextLight,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headline5: GoogleFonts.poppins(
          color: AppColors.kTextLight,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
