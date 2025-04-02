import 'package:flutter/material.dart';
import 'package:learning/account.dart';
import 'package:learning/home.dart';
import 'package:learning/myclasses.dart';

class Begin extends StatefulWidget {
   const  Begin({super.key});
   

  @override
  State<Begin> createState() => _BeginState(); 
}

class _BeginState extends State<Begin> {
   int _selectedIndex = 0;
   final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Myclasses(),
    Account(),

  ];

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 211, 236, 248),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 92, 42, 179),
        onTap: _onItemTapped,
      ),
      backgroundColor: const Color.fromARGB(255, 211, 236, 248),
      
    );
  }
}