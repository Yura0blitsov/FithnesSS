import 'package:flutter/material.dart';
import 'package:untitled/pages/Sleep.dart';
import 'package:untitled/pages/Trening.dart';
import 'package:untitled/pages/Nutrition.dart';
import 'package:untitled/pages/Achievements.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Achievements(),
    Nutrition(),
    Trening(),
    Sleep()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'Мои показатели',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_food_rounded),
            label: 'Питание',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics),
            label: 'Тренировки',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airline_seat_individual_suite),
            label: 'Сон',
            backgroundColor: Colors.black54,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
