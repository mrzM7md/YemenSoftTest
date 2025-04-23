import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yemen_soft_test/core/values/colors.dart';

void showMessage({
  required BuildContext context,
  required String message,
  required bool isSuccess,
}) {
  // تحديد لون الخلفية بناءً على النجاح أو الفشل
  final backgroundColor = isSuccess ? Colors.green : Colors.redAccent;

  final snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            message,
            style: TextStyle(color: Color(textColor), fontSize: 12.sp),
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, color: Color(textColor)),
          onPressed: () {
            // إغلاق الرسالة عند النقر على الزر
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: 5), // الاختفاء بعد 5 دقائق
  );

  // عرض الـ SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
