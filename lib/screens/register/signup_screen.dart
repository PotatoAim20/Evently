import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/extenstions/build_context_extenstion.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = 'SignupScreen';

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Color(0xff101127),
            fontWeight: FontWeight.w400,
            fontSize: 28.sp,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/logo2.png', height: 163.h, width: 186.w),
            SizedBox(height: 24.h),
            CustomTextFormField(hintText: 'Name', icon: Icon(Icons.person)),
            SizedBox(height: 16.h),
            CustomTextFormField(hintText: 'Email', icon: Icon(Icons.mail)),
            SizedBox(height: 16.h),
            CustomTextFormField(hintText: 'Password', icon: Icon(Icons.lock)),
            SizedBox(height: 16.h),
            CustomTextFormField(
              hintText: 'Re Password',
              icon: Icon(Icons.lock),
            ),

            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: context.labelSmall?.copyWith(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already Have Account ? ",
                          style: context.labelSmall,
                        ),
                        TextSpan(
                          text: "Login",
                          style: context.labelSmall?.copyWith(
                            color: Color(0xff5669FF),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff5669FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 3.r,
                      ),
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.setLocale(Locale('en'));
                          },
                          child: Container(
                            decoration:
                                context.locale.toString() == 'en'
                                    ? BoxDecoration(
                                      border: BoxBorder.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 4.r,
                                      ),
                                      shape: BoxShape.circle,
                                    )
                                    : null,
                            child: Image.asset(
                              'assets/images/en_icon.png',
                              height: 30.h,
                              width: 30.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 20.w),

                        InkWell(
                          onTap: () {
                            context.setLocale(Locale('ar'));
                          },
                          child: Container(
                            decoration:
                                context.locale.toString() == 'ar'
                                    ? BoxDecoration(
                                      border: BoxBorder.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 4.r,
                                      ),
                                      shape: BoxShape.circle,
                                    )
                                    : null,
                            child: Image.asset(
                              'assets/images/ar_icon.png',
                              height: 30.h,
                              width: 30.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
