import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getAppTextField(String hint, {bool obscureText = false}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(fontSize: 14.sp),
      filled: true,
      fillColor: const Color(0xFFF1F4F9),
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
