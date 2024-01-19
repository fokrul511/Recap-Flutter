import 'package:flutter/material.dart';
import 'package:recape_flutter/fragment/item_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const ItemScreen(),
    const Text('Profile'),
    const Text('Search'),
    const Text('Cart'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'cart'),
        ],
        currentIndex: _currentIndex,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,//when item 4 over then use this line...Other ways not work Background colors,
        backgroundColor: Colors.blue,
        showUnselectedLabels: false,
        selectedFontSize: 16,
        onTap: (index) {

          _currentIndex = index;
          setState(() {});
        },
      ),
      body: Center(child: screens[_currentIndex]),
    );
  }
}

