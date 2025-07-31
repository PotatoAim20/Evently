import 'package:flutter/material.dart';

class FavTab extends StatelessWidget {
  static String routeName = 'FavTab';

  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
