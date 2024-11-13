import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text("menu"),
          decoration: BoxDecoration(
            color: const Color.fromARGB(43, 0, 0, 0),
          ),
        ),
        ListTile(
          title: Text('ajedrez'),
          onTap: () {
            Navigator.pushNamed(context, '/ajedrez');
          },
        ),
        ListTile(
          title: Text('vida'),
          onTap: () {
            Navigator.pushNamed(context, '/vida');
          },
        ),
        ListTile(
          title: Text('educación'),
          onTap: () {
            Navigator.pushNamed(context, '/educacion');
          },
        ),
      ],
    ));
  }
}
