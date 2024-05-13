import 'package:flutter/material.dart';

import '../home/view.dart';
import '../dynamic/view.dart';
import '../mine/view.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final _pageOption = [
    const HomePage(),
    const DynamicPage(),
    const MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.white,
        height: 60,
        //labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(
            icon: CustomIcon("assets/icons/home.png"),
            label: "首页",
          ),
          NavigationDestination(
            icon: CustomIcon("assets/icons/windmill.png"),
            label: "动态",
          ),
          NavigationDestination(
            icon: CustomIcon("assets/icons/bilibili-line.png"),
            label: "我的",
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

class CustomIcon extends Image {
  CustomIcon(
    super.name, {
    super.key,
  }) : super.asset(width: 25, height: 25);
}
