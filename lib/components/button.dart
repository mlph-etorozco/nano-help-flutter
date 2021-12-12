import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;
  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.orange,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Container(
      height: 50,
      width: 250,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
