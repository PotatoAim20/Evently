import 'package:evently/screens/home/tabs/events_tab.dart';
import 'package:evently/screens/home/tabs/fav_tab.dart';
import 'package:evently/screens/home/tabs/map_tab.dart';
import 'package:evently/screens/home/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> tabs = [EventsTab(), MapTab(), FavTab(), ProfileTab()];

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff5669FF),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(75.r),
          side: BorderSide(color: Color(0xffF2FEFF), width: 5),
        ),
        child: Icon(Icons.add, color: Color(0xffF2FEFF), size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          ),
        ),
        titleSpacing: 16,
        backgroundColor: Color(0xff5669FF),
        toolbarHeight: 174.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xffF2FEFF),
              ),
            ),
            Text(
              'John Safwat',
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffF2FEFF),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.location_pin, color: Color(0xffF2FEFF), size: 24),
                SizedBox(width: 4.w),
                Text(
                  'Cairo , Egypt',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffF2FEFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: 'Map'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Love',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        backgroundColor: Color(0xff5669FF),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab,
        iconSize: 24,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
        selectedIconTheme: IconThemeData(size: 24),
        unselectedIconTheme: IconThemeData(size: 24),
        selectedItemColor: Color(0xffF2FEFF),
        onTap: (value) {
          currentTab = value;
          setState(() {});
        },
      ),

      body: tabs[currentTab],
    );
  }
}
