import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/app_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/create_event/create_event_screen.dart';
import 'package:evently/screens/edit_event/edit_event_screen.dart';
import 'package:evently/screens/event_details/event_details_screen.dart';
import 'package:evently/screens/home/home_screen.dart';
import 'package:evently/screens/intro/intro_screen.dart';
import 'package:evently/screens/intro/onboarding_screen.dart';
import 'package:evently/screens/register/login_screen.dart';
import 'package:evently/screens/register/signup_screen.dart';
import 'package:evently/shared_pref/shared_pref.dart';
import 'package:evently/theme/dark_theme.dart';
import 'package:evently/theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool firstTimeUser = await SharedPref.isFirstTimeUser();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.enableNetwork();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(firstTimeUser: firstTimeUser),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool firstTimeUser;
  MyApp({super.key, required this.firstTimeUser});

  final lightThemeApp = LightTheme();
  final darkThemeApp = DarkTheme();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: lightThemeApp.themeData,
          darkTheme: darkThemeApp.themeData,
          themeMode: appProvider.themeMode,

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          debugShowCheckedModeBanner: false,

          routes: {
            IntroScreen.routeName: (context) => IntroScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            SignupScreen.routeName: (context) => SignupScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            CreateEventScreen.routeName: (context) => CreateEventScreen(),
            EventDetails.routeName: (context) => EventDetails(),
            EditEvent.routeName: (context) => EditEvent(),
            OnboardingScreen.routeName: (context) => OnboardingScreen(),
          },
          initialRoute:
              userProvider.firebaseUser != null
                  ? HomeScreen.routeName
                  : ((firstTimeUser)
                      ? IntroScreen.routeName
                      : LoginScreen.routeName),
        );
      },
    );
  }
}
