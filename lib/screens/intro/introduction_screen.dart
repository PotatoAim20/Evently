import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/app_provider/app_provider.dart';
import 'package:evently/extenstions/build_context_extenstion.dart';
import 'package:evently/screens/register/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class IntroductionScreen extends StatefulWidget {
  static String routeName = 'FirstScreen';
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/images/logo.png')),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 28.h,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 361.h,
              width: 361.w,
              child: Image.asset('assets/images/intro_bg.png'),
            ),
            Text(
              "introduction_title".tr(),
              style: context.labelMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("introduction_subtitle".tr(), style: context.labelSmall),
            Row(
              children: [
                Text(
                  "language".tr(),
                  style: context.labelMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Spacer(),
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
            Row(
              children: [
                Text(
                  "theme".tr(),
                  style: context.labelMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 3.r,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          isDark = false;
                          appProvider.changeTheme(isDark);
                        },
                        child: Container(
                          decoration:
                              !isDark
                                  ? BoxDecoration(
                                    border: BoxBorder.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 4.r,
                                    ),
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  )
                                  : null,
                          child: Image.asset(
                            'assets/images/light_theme_icon.png',
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.cover,
                            color:
                                !isDark
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                          ),
                        ),
                      ),

                      SizedBox(width: 20.w),

                      InkWell(
                        onTap: () {
                          isDark = true;
                          appProvider.changeTheme(isDark);
                        },
                        child: Container(
                          decoration:
                              isDark
                                  ? BoxDecoration(
                                    border: BoxBorder.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 4.r,
                                    ),
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  )
                                  : null,
                          child: Image.asset(
                            'assets/images/dark_theme_icon.png',
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.cover,
                            color:
                                isDark
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text(
                "intro_btn".tr(),
                style: context.labelMedium?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
