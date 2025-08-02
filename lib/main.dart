import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/app_provider/app_provider.dart';
import 'package:evently/screens/create_event/create_event_screen.dart';
import 'package:evently/screens/home/home_screen.dart';
import 'package:evently/screens/intro/introduction_screen.dart';
import 'package:evently/screens/register/login_screen.dart';
import 'package:evently/screens/register/signup_screen.dart';
import 'package:evently/theme/dark_theme.dart';
import 'package:evently/theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.enableNetwork();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final lightThemeApp = LightTheme();
  final darkThemeApp = DarkTheme();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

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
            IntroductionScreen.routeName: (context) => IntroductionScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            SignupScreen.routeName: (context) => SignupScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            CreateEventScreen.routeName: (context) => CreateEventScreen(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
