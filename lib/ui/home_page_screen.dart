import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dokan/ui/productListScreen.dart';
import 'package:dokan/ui/profile_Screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 2;
  static List<Widget> _screens = <Widget>[
    ScreenTwo(),
    ScreenThree(),
    ProductListScreen(),
    ScreenFour(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        child: CurvedNavigationBar(
          index: _selectedIndex,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color(0xFFF75F55),
          animationDuration: const Duration(milliseconds: 300),
          items: <Widget>[
            Container(
              height: 56,
              child: Image.asset("assets/NavigationBar/home.png"),
            ),
            Container(
              height: 56,
              child: Image.asset("assets/NavigationBar/Com.png"),
            ),
            Container(
              height: 56,
              child: Image.asset(
                "assets/NavigationBar/search.png",
              ),
            ),
            Container(
              height: 56,
              child: Image.asset("assets/NavigationBar/cartt.png"),
            ),
            Container(
              height: 56,
              child: Image.asset("assets/NavigationBar/prof.png"),
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
      body: _screens.elementAt(_selectedIndex),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 12'),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 2'),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 3'),
    );
  }
}

class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 4'),
    );
  }
}

class ScreenFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 5'),
    );
  }
}
