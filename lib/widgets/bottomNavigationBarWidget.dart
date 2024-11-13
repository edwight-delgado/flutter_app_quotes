import 'package:flutter/material.dart';

class buttomNavigationBarWidget extends StatefulWidget {
  const buttomNavigationBarWidget({super.key});

  @override
  State<buttomNavigationBarWidget> createState() =>
      _buttomNavigationBarWidgetState();
}

class _buttomNavigationBarWidgetState extends State<buttomNavigationBarWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      //print(_selectedIndex);
    }

    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.sync),
              onPressed: (() {
                Navigator.pushNamed(context, "/");
              }),
            ),
            label: 'nuevo'),
        BottomNavigationBarItem(icon: Icon(Icons.copy), label: 'copiar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.share_rounded), label: 'compartir')
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
