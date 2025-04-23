import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemen_soft_test/core/methods/langs_methods.dart';
import 'package:yemen_soft_test/core/values/images.dart';

import '../../../core/components/widgets_components.dart';
import '../../../generated/l10n.dart';
import 'dialogs/languages_dialogs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    S loc = S.of(context);
    return SafeArea(child: Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsetsDirectional.only(start: !isRTL() ? 15.r : 0),
                          child: SvgPicture.asset(
                              appLogoSvgImage),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              RotatedBox(
                                quarterTurns:  isRTL() ? 3 : 4 ,
                                child:  SvgPicture.asset(
                                  redCornerSvgImage,
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    showLanguagesDialog(context: context);
                                  }, icon: Icon(Icons.language, color: Colors.white)),
                            ],
                          ),
                        ]
                    ),
                  ],
                ),

                Expanded(child:
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 200.h),
                      // Welcome Back Text
                      Text(
                        loc.welcome_back,
                        style: GoogleFonts.cairo(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF004E59),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        loc.log_back_into_your_account,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Input Fields
                      getAppTextField(loc.user_id),
                      SizedBox(height: 16.h),
                      getAppTextField(loc.password, obscureText: true),
                      SizedBox(height: 10.h),

                      // Show More
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          loc.show_more,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF004E59),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            loc.login,
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      // Illustration
                      SizedBox(height: 16.h),
                      Expanded(child:SvgPicture.asset(deliverySvgImage, fit: BoxFit.fill,)
                      )
                    ],
                  ),
                )
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

}