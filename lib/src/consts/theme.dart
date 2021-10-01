import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      bottomAppBarColor: Colors.white,
      primaryColor: const Color(0xffe66d16),
      fontFamily: GoogleFonts.aBeeZee().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: const Color(0xffe66d16),
          fontSize: 18.sp,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffe66d16),
        ),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffe66d16),
        ),
      ),
    );
  }
}
