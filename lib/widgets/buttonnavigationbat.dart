import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../screens/cart.dart';
import '../screens/home_page.dart';

class Bottom extends StatefulWidget {
  final int currentIndex;
  const Bottom({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      fixedColor: Color.fromARGB(255, 36, 14, 6),
      showUnselectedLabels: false,

      elevation: 20.0,
      iconSize: 30.0,
      selectedFontSize: 15.0,
      // ignore: prefer_const_constructors
      selectedLabelStyle:
          // ignore: prefer_const_constructors
          TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),

      currentIndex: widget.currentIndex,
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        } else if (index == 1) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else {
          print("hello");
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_sharp),
          label: 'offer',
        ),
      ],
    );
  }
}
