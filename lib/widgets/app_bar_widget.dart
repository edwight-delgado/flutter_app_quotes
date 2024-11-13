import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.param});
  final String param;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(43, 0, 0, 0),
      title: Text(
        "Frases ${param}",
        style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 30, fontFamily: "Ic"),
      ),
      actions: const [Icon(Icons.close)],
    );
  }
}
