import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/images.dart';

Widget getAppLoader(){
  return Image.asset(loadingGifImage, height: 20.h, width: 20.w,);
}

Widget getAppTextField({required String hint, required TextEditingController controller,
  required validator,
  bool obscureText = false}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: validator,
    textDirection: TextDirection.ltr,
    decoration: InputDecoration(
      hintText: hint,
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
