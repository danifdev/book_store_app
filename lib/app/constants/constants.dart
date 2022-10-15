import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme = TextTheme(
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
);

String errorLink =
    "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";

class AppColors {
  static Color lightBlue = const Color(0xffCFEDEF);
  static Color black = Colors.black87;
  static Color white = Colors.white;
  static Color kTextDark = Colors.black87;
  static Color kTextLight = Colors.white70;
}

List<Color> boxColors = const [
  Color(0xffCEEDEF),
  Color(0xffBFBFBF),
  Color(0xffEBECF1),
  Color(0xffFDF7DD),
  Color(0xffF9CFE3),
  Color(0xffFBEBC7),
  Color(0xffE9E8E6)
];
