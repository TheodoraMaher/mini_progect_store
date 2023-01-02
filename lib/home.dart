import 'package:flutter/material.dart';
import 'package:shoestore/cart.dart';
import 'package:shoestore/category.dart';
import 'package:shoestore/fav.dart';
import 'package:shoestore/home_part.dart';
import 'package:shoestore/new.dart';
import 'package:shoestore/profile.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> images = [
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',
    'assets/images/s.png',
  ];
  List<String> title = [
    'Title1',
    'title2',
    'title3',
    'title4',
    'Title1',
    'title2',
    'title3',
    'title4'
  ];
  List<String> mass = [
    'shoping1',
    'shoping2',
    'shoping3',
    'shoping4',
    'shoping1',
    'shoping2',
    'shoping3',
    'shoping4'
  ];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      appBar: AppBar(
        backgroundColor: Color(0xfffce4ec),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => fav()));
            },
            icon: Icon(Icons.favorite, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cart()));
            },
            icon: Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
        title: Text('shoe store',
            style: TextStyle(fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,)),
        centerTitle: true,
      ),
      body: SelectedIndexPage(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'category',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_rounded),
              label: 'me',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,

        ),
    );
  }
  Widget SelectedIndexPage(){
    switch(_selectedIndex){
      case 0: return HomePart() ;
      case 1: return category(); /// Hna ely 3aozah yzhr fe page categories
      default: return profile(); /// hna ely 3aozah yzhr fe page me
    }
  }

}
