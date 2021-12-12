import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? child;
  final double height;

  const NavBar({Key? key, required this.title, this.child, this.height = 120})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return AppBar(
        shadowColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: color));
  }
}
