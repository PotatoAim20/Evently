import 'package:evently/screens/register/login_screen.dart';
import 'package:evently/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'IntroductionScreen2';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pageDecoration = PageDecoration(pageColor: Color(0xffF2FEFF));

    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: Image.asset('assets/images/logo.png'),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/hot_trending.png',
                height: 357.h,
                width: 357.w,
              ),
              SizedBox(height: 39.h),
              Text(
                'Find Events That Inspire You',
                style: GoogleFonts.inter(
                  color: Color(0xff5669FF),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 39.h),
              Text(
                "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/images/logo.png'),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/being_creative.png',
                height: 357.h,
                width: 357.w,
              ),
              SizedBox(height: 39.h),
              Text(
                'Effortless Event Planning',
                style: GoogleFonts.inter(
                  color: Color(0xff5669FF),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 39.h),
              Text(
                "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/images/logo.png'),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/being_creative2.png',
                height: 357.h,
                width: 357.w,
              ),
              SizedBox(height: 39.h),
              Text(
                'Effortless Event Planning',
                style: GoogleFonts.inter(
                  color: Color(0xff5669FF),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 39.h),
              Text(
                "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        SharedPref.setFirstTimeComplete();
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          (route) => false,
        );
      },
      showBackButton: true,
      back: Container(
        height: 37.6.h,
        width: 37.6.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: BoxBorder.all(color: Color(0xff5669FF), width: 1),
        ),
        child: Icon(Icons.arrow_back, color: Color(0xff5669FF), size: 20),
      ),
      next: Container(
        height: 37.6.h,
        width: 37.6.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: BoxBorder.all(color: Color(0xff5669FF), width: 1),
        ),
        child: Icon(Icons.arrow_forward, color: Color(0xff5669FF), size: 20),
      ),
      done: Text(
        'Done',
        style: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff5669FF),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black,
        activeSize: Size(25.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
