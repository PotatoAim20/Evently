import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/create_event/create_event_screen.dart';
import 'package:evently/screens/home/tabs/events_tab.dart';
import 'package:evently/screens/home/tabs/fav_tab.dart';
import 'package:evently/screens/home/tabs/map_tab.dart';
import 'package:evently/screens/home/tabs/profile_tab.dart';
import 'package:evently/screens/register/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    'All',
    'Eating',
    'Meeting',
    'Workshop',
    'Birthday',
    'Book Club',
    'Exhibition',
    'Gaming',
    'Holiday',
  ];

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEventScreen.routeName);
        },
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
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              userProvider.clearData();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (route) => false,
              );
            },
            icon: Icon(Icons.exit_to_app, color: Colors.white),
          ),
        ],
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
              userProvider.userModel?.name ?? '',
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
            SizedBox(height: 8.h),
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedCategoryIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(37.r),
                        color:
                            selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.transparent,
                      ),
                      child: Text(
                        categories[index],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color:
                              selectedCategoryIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: categories.length,
              ),
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

      body:
          [
            EventsTab(category: categories[selectedCategoryIndex]),
            MapTab(),
            FavTab(),
            ProfileTab(),
          ][currentTab],
    );
  }
}
