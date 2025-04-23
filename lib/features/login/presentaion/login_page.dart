import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemen_soft_test/core/components/messages_components.dart';
import 'package:yemen_soft_test/core/methods/langs_methods.dart';
import 'package:yemen_soft_test/core/routes/router.dart';
import 'package:yemen_soft_test/core/values/images.dart';
import 'package:yemen_soft_test/features/login/business/login_state_management/login_cubit.dart';
import 'package:yemen_soft_test/features/login/data/models/user_login_model.dart';

import '../../../core/components/widgets_components.dart';
import '../../../generated/l10n.dart';
import 'dialogs/languages_dialogs.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  late LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    loginCubit = LoginCubit.get(context);
    S loc = S.of(context);

    return SafeArea(
        child: Center(
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
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: !isRTL() ? 15.r : 0),
                            child: SvgPicture.asset(appLogoSvgImage),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              RotatedBox(
                                quarterTurns: isRTL() ? 3 : 4,
                                child: SvgPicture.asset(
                                  redCornerSvgImage,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showLanguagesDialog(context: context);
                                  },
                                  icon: Icon(Icons.language,
                                      color: Colors.white)),
                            ],
                          ),
                        ]),
                  ],
                ),
                Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 130.h),
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
                          getAppTextField(hint: loc.user_id, controller: usernameController, validator: (value){
                            if(value.toString().isEmpty){
                              return loc.required;
                            }
                          }),
                          SizedBox(height: 16.h),
                          getAppTextField(hint: loc.password, controller: passController, obscureText: true,validator: (value){
                            if(value.toString().isEmpty){
                              return loc.required;
                            }
                          }),
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
                            child: BlocConsumer<LoginCubit, LoginState>(
                              listenWhen: (previous, current) => current is SignInAccountState && current.isLoaded,
                              listener: (context, state) {
                                if(state is SignInAccountState){
                                  if(state.isSuccess){
                                    OrdersRoute().pushReplacement(context);
                                  }else{
                                    showMessage(context: context, message: state.message, isSuccess: state.isSuccess);
                                  }
                                }
                              },
                              buildWhen: (previous, current) => current is SignInAccountState,
                              builder: (context, state) {
                                if(state is SignInAccountState && !state.isLoaded){
                                  return CircularProgressIndicator();
                                }

                                return ElevatedButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  loginCubit.login(user: UserLoginModel(
                                      langNo: "${getCurrentLanNumberFromSymbol()}",
                                      deliveryNo: usernameController.text.trim(),
                                      password: passController.text.trim())
                                  );
                                }
                              },
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
                            );
  },
),
                          ),

                          // Illustration
                          SizedBox(height: 16.h),
                          Expanded(
                              child: SvgPicture.asset(
                                deliverySvgImage,
                                fit: BoxFit.contain,
                              ))
                        ],
                      )
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
