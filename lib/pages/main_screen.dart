import 'package:flutter/material.dart';

class MainScreenUI extends StatefulWidget {
  const MainScreenUI({super.key});

  @override
  State<MainScreenUI> createState() => _MainScreenUIState();
}

class _MainScreenUIState extends State<MainScreenUI> {
  @override
  Widget build(BuildContext context) {
    return WidgetBottomNavBar();
  }
}


class WidgetBottomNavBar extends StatefulWidget {
  const WidgetBottomNavBar({super.key});

  @override
  State<WidgetBottomNavBar> createState() => _WidgetBottomNavBarState();
}

class _WidgetBottomNavBarState extends State<WidgetBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}