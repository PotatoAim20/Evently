import 'package:evently/app_provider/app_provider.dart';
import 'package:evently/first_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/theme/dark_theme.dart';
import 'package:evently/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AppProvider(), child: Evently()),
  );
}

class Evently extends StatelessWidget {
  Evently({super.key});

  final lightThemeApp = LightTheme();
  final darkThemeApp = DarkTheme();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      theme: lightThemeApp.themeData,
      darkTheme: darkThemeApp.themeData,
      themeMode: appProvider.themeMode,

      debugShowCheckedModeBanner: false,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: appProvider.locale,

      routes: {FirstScreen.routeName: (context) => FirstScreen()},
      initialRoute: FirstScreen.routeName,
    );
  }
}
