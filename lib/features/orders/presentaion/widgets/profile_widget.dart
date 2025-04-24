import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yemen_soft_test/core/methods/user_delivery_methods.dart';
import 'package:yemen_soft_test/core/values/colors.dart';
import 'package:yemen_soft_test/core/values/images.dart';
import 'package:yemen_soft_test/features/login/presentaion/dialogs/languages_dialogs.dart';

import '../../../../core/methods/langs_methods.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127.h,
      width: double.infinity,
      color: Color(redColor),
      child: Stack(
        alignment: !isRTL() ? Alignment.topRight : Alignment.topLeft,
        children: [
          RotatedBox(
            quarterTurns: isRTL() ? 3 : 4,
            child: Image.asset(blueCornerImage),
          ),

          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.r),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(flex: 5,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getDeliveryName().split(" ")[0], style: TextStyle(fontSize: 20.sp, color: Colors.white),),
                    Text(getDeliveryName().split(" ")[1], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Colors.white),),
                  ],
                )),
                Expanded(flex: 3, child: Padding(padding: EdgeInsetsDirectional.only(top: 20.r), child: Image.asset(deliverMmanImage, fit: BoxFit.fill, height: double.infinity, width: double.infinity,),)),
                Expanded(
                  flex: 2, child: Container(
                  height: double.infinity,
                  child: Center( // لتوسيط الأيقونة داخل الحاوية
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0), // يمكنك تعديل قيمة الانحناء
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // لون الظل
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1), // إزاحة الظل
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          showLanguagesDialog(context: context);
                        },
                        icon: const Icon(Icons.language, color: Color(0xFF00695C)), // استخدم const للأيقونة الثابتة
                      ),
                    ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
