import 'package:flutter/material.dart';
import 'package:huge_plant/body_home/home1.dart';
import 'package:huge_plant/body_home/home3.dart';
import '../body_home/profile.dart';
import '../data/database_helper.dart';
import '../search/search.dart';

class CustomNavBar extends StatefulWidget {
  CustomNavBar({Key? key, required this.dbHelper}) : super(key: key);
  DatabaseHelper dbHelper;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final List<Widget> screens = [
    HomePage1(
      dbHelper: DatabaseHelper(),
    ),
    SearchScreen(
      dbHelper: DatabaseHelper(),
    ),
    PlantScreen(
      dbHelper: DatabaseHelper(),
    ),
    profile(),
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screens,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 73, 153, 98),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              ('assets/icons/home.png'),
            ),
            label: 'Home', backgroundColor: Color.fromARGB(255, 54, 76, 57)
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ('assets/icons/planet-earth.png'),
            ),
            label: 'Seach', backgroundColor: Color.fromARGB(255, 70, 135, 79)
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ('assets/icons/blossom.png'),
            ),
            label: 'Favorite' , backgroundColor: Color.fromARGB(255, 190, 94, 209)
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ('assets/icons/housekeeper.png'),
            ),
            label: 'Profile',backgroundColor: Color.fromARGB(255, 129, 62, 50),
          ),
        ],
      ),
    );
  }
}
