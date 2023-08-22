import 'package:flutter/material.dart';

import '../../app/constants/color.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: TColors.appbarColor,
      ),
      body: Column(
        children: [
          Text("Scaffold"),
        ],
      ),
    );
  }
}
