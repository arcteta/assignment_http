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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: menu 1',
      style: optionStyle,
    ),
    Text(
      'Index 1: menu 2',
      style: optionStyle,
    ),
    Text(
      'Index 2: menu 3',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('HTTP - Assignment'),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Posts',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_rounded),
            label: 'Photos',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'user',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
