import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/extenstions/build_context_extenstion.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/home/home_screen.dart';
import 'package:evently/screens/register/signup_screen.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 48.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/logo2.png', height: 163.h, width: 186.w),
            SizedBox(height: 24.h),
            CustomTextFormField(
              hintText: 'Email',
              icon: Icon(Icons.email),
              controller: emailController,
            ),
            SizedBox(height: 16.h),
            CustomTextFormField(
              hintText: 'Password',
              icon: Icon(Icons.lock),
              controller: passwordController,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forget Password?',
                  style: GoogleFonts.inter(
                    color: Color(0xff5669FF),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff5669FF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                FirebaseManager.login(
                  email: emailController.text,
                  password: passwordController.text,
                  onError: (value) {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text(value),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                    );
                  },
                  onSuccess: () {
                    userProvider.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => false,
                    );
                  },
                );
              },
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
                Navigator.pushNamed(context, SignupScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't Have Account ? ",
                          style: context.labelSmall,
                        ),
                        TextSpan(
                          text: "Create Account",
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
              children: [
                Expanded(child: Divider(height: 1.h, color: Color(0xff5669FF))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Or',
                    style: context.labelSmall?.copyWith(
                      color: Color(0xff5669FF),
                    ),
                  ),
                ),
                Expanded(child: Divider(height: 1.h, color: Color(0xff5669FF))),
              ],
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xffF2FEFF)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Image.asset('assets/images/google_icon.png'),
                  ),
                  Text(
                    'Login With Google',
                    style: context.labelSmall?.copyWith(
                      color: Color(0xff5669FF),
                      fontSize: 20.sp,
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
