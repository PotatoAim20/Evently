import 'package:evently/extenstions/build_context_extenstion.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  static String routeName = 'FirstScreen';
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isArabic = false;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/images/logo.png')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/intro_bg.png'),
              SizedBox(height: 28),
              Text(
                context.locals?.intro_title1 ?? '',
                style: context.labelMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 28),
              Text(
                context.locals?.intro_title2 ?? '',
                style: context.labelSmall,
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Text(
                    context.locals?.language ?? '',
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
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            isArabic = false;
                            setState(() {});
                          },
                          child: Container(
                            decoration:
                                !isArabic
                                    ? BoxDecoration(
                                      border: BoxBorder.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 4,
                                      ),
                                      shape: BoxShape.circle,
                                    )
                                    : null,
                            child: Image.asset(
                              'assets/images/en_icon.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 20),

                        InkWell(
                          onTap: () {
                            isArabic = true;
                            setState(() {});
                          },
                          child: Container(
                            decoration:
                                isArabic
                                    ? BoxDecoration(
                                      border: BoxBorder.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 4,
                                      ),
                                      shape: BoxShape.circle,
                                    )
                                    : null,
                            child: Image.asset(
                              'assets/images/ar_icon.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Text(
                    context.locals?.theme ?? '',
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
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            isDark = false;
                            setState(() {});
                          },
                          child: Container(
                            decoration:
                                !isDark
                                    ? BoxDecoration(
                                      border: BoxBorder.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 4,
                                      ),
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                    )
                                    : null,
                            child: Image.asset(
                              'assets/images/light_theme_icon.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                              color:
                                  !isDark
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),

                        SizedBox(width: 20),

                        InkWell(
                          onTap: () {
                            isDark = true;
                            setState(() {});
                          },
                          child: Container(
                            decoration:
                                isDark
                                    ? BoxDecoration(
                                      border: BoxBorder.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 4,
                                      ),
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                    )
                                    : null,
                            child: Image.asset(
                              'assets/images/dark_theme_icon.png',
                              height: 30,
                              width: 30,
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
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  context.locals?.start ?? '',
                  style: context.labelMedium?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
