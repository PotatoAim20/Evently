import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MapTab extends StatelessWidget {
  static String routeName = 'MapTab';

  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
