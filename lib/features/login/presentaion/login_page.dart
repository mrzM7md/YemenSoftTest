import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemen_soft_test/core/values/images.dart';

import '../../../core/components/widgets_components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                Image.asset(loginBackgroundImage, fit: BoxFit.fill, height: double.infinity, width:  double.infinity,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.h),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFD12A1F),
                          radius: 20.r,
                          child: const Icon(Icons.language, color: Colors.white),
                        ),
                      ),

                      SizedBox(height: 200.h),

                      // Welcome Back Text
                      Text(
                        'Welcome Back!',
                        style: GoogleFonts.cairo(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF004E59),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Log back into your account',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Input Fields
                      getAppTextField('User ID'),
                      SizedBox(height: 16.h),
                      getAppTextField('Password', obscureText: true),
                      SizedBox(height: 10.h),

                      // Show More
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Show More',
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
                            'Log in',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      // Illustration
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}